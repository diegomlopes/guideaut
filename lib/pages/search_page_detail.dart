import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guideaut/common/widgets/star_rating.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/features/auth/domain/entities/user_entity.dart';
import 'package:guideaut/features/auth/domain/usecases/get_logged_user.dart';
import 'package:guideaut/features/recomendations/domain/entities/rating_entity.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';
import 'package:guideaut/features/recomendations/domain/usecases/rating_recomendation.dart';
import 'package:guideaut/pages/entities/clamped_average_calculator.dart';
import 'package:guideaut/providers/recomendations_provider.dart';
import 'package:guideaut/providers/user_provider.dart';
import 'package:guideaut/theme/styles.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';

class SearchRecomendationDetail extends ConsumerStatefulWidget {
  const SearchRecomendationDetail({required this.doc, Key? key})
      : super(key: key);

  final RecomendationEntity doc;

  @override
  ConsumerState<SearchRecomendationDetail> createState() =>
      _SearchRecomendationDetailState();
}

class _SearchRecomendationDetailState
    extends ConsumerState<SearchRecomendationDetail> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(loggedUserProvider.notifier).state = await _userLogged();
    });
  }

  Future<UserEntity?> _userLogged() async {
    final getUser = GetLoggedUser();
    final loggedUserResult = await getUser(NoParams());

    if (loggedUserResult.isLeft()) return null;

    return loggedUserResult.getOrElse(() => null);
  }

  int? rate;

  @override
  Widget build(BuildContext context) {
    final _loggedUser = ref.watch(loggedUserProvider);
    bool _isRating = false;

    final average = ClampedAverageCalculator.calculate(
      widget.doc.ratings.map((e) => e.rate).toList(),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Div(
              divison: const Division(colS: 12, colM: 10, colL: 8),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Card(
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            widget.doc.title.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Spacer(flex: 15),
                            Text("Avaliações: ${widget.doc.ratings.length}"),
                            const Spacer(flex: 1),
                            Text("Nota: ${average}"),
                            const Spacer(flex: 1),
                            StarRating(
                              onRating: (rating) => rate = rating,
                              rating: average.toInt(),
                            ),
                            const Spacer(flex: 1),
                            _loggedUser.isNull
                                ? Container()
                                : ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        _isRating = true;
                                      });
                                      await ratingRecomendation(rate);
                                      setState(() {
                                        _isRating = false;
                                      });
                                    },
                                    child: _isRating
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : const Text("Avaliar"),
                                    style: buttonStyle,
                                  ),
                            const Spacer(flex: 1),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            widget.doc.description,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Future<void> ratingRecomendation(int? rate) async {
    final loggedUser = ref.read(loggedUserProvider.notifier).state;
    if (loggedUser != null && rate != null) {
      final useCase = RatingRecomendation();
      final result = await useCase(
        RatingParams(
          recomendation: widget.doc,
          rating: RatingEntity(
            rate: rate,
            userId: loggedUser.id!,
          ),
        ),
      );
      ref.refresh(recomendationsProvider);
      ref.refresh(searchResultProvider);

      if (result.isRight()) {
        showSuccessSubmit();
      } else {
        showErrorSubmit();
      }
    } else {
      showErrorSubmit();
    }
  }

  void showSuccessSubmit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso'),
          content: const Text('Avaliação submetida!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void showErrorSubmit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: const Text('Erro ao avaliar recomendação!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
