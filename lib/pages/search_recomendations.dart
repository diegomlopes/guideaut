import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:guideaut/common/widgets/star_rating.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/features/recomendations/domain/entities/recomendation_entity.dart';
import 'package:guideaut/features/recomendations/domain/usecases/get_recomendations.dart';
import 'package:guideaut/pages/entities/boyer_moore.dart';
import 'package:guideaut/pages/entities/clamped_average_calculator.dart';
import 'package:guideaut/providers/recomendation_selected.dart';
import 'package:guideaut/providers/recomendations_provider.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_ui/responsive_ui.dart';

class SearchRecomendations extends ConsumerStatefulWidget {
  const SearchRecomendations({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchRecomendations> createState() =>
      _SearchRecomendationsState();
}

class _SearchRecomendationsState extends ConsumerState<SearchRecomendations> {
  final _searchController = TextEditingController();
  String _term = "";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(recomendationsProvider.notifier).state =
          await getRecomendations();
      setItensByCategoryWith("");
    });
  }

  Future<List<RecomendationEntity>> getRecomendations() async {
    final useCase = GetRecomendations();
    final result = await useCase(NoParams());

    if (result.isLeft()) return [];

    return result.getOrElse(() => []);
  }

  void setItensByCategoryWith(String term) {
    _term = term;

    final documents = ref.read(recomendationsProvider.notifier).state;

    List<RecomendationEntity> validDocuments = [];

    for (var doc in documents) {
      final isValid =
          BoyerMoore.search(doc.title.toLowerCase(), term.toLowerCase()) ||
              BoyerMoore.search(
                  doc.description.toLowerCase(), term.toLowerCase()) ||
              BoyerMoore.search(doc.category.toLowerCase(), term.toLowerCase());
      if (isValid) {
        validDocuments.add(doc);
      }
    }

    Map<String, List<RecomendationEntity>> categoryMap = {};

    for (var result in validDocuments) {
      final category = result.category.toLowerCase();
      if (categoryMap.containsKey(category)) {
        categoryMap[category]?.add(result);
      } else {
        categoryMap.putIfAbsent(category, () => [result]);
      }
    }

    ref.read(searchResultProvider.notifier).state = categoryMap;
  }

  @override
  Widget build(BuildContext context) {
    final searchResult = ref.watch(searchResultProvider);
    final String id = ModalRoute.of(context)!.settings.arguments as String;

    searchResult[id]!.sort((a, b) => ClampedAverageCalculator.calculate(
                a.ratings.map((e) => e.rate).toList()) <
            ClampedAverageCalculator.calculate(
                b.ratings.map((e) => e.rate).toList())
        ? 1
        : 0);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${AppLocalizations.of(context)!.results_for} ${id.toUpperCase()}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Div(
                  divison: const Division(colS: 12, colM: 12, colL: 9),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => setItensByCategoryWith(value),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!
                            .look_for_recomendations,
                      ),
                    ),
                  ),
                ),
                Responsive(
                  children: searchResult.keys
                      .where((e) => e == id)
                      .map(
                        (key) => Div(
                          divison: const Division(colS: 12, colM: 12, colL: 8),
                          child: Column(
                            children: searchResult[key]!
                                .map(
                                  (doc) => Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Clickable(
                                        onPressed: () {
                                          ref
                                              .read(
                                                  recomendationSelectedProvider
                                                      .notifier)
                                              .state = doc;

                                          Navigator.pushNamed(
                                            context,
                                            Routes
                                                .searchRecomendationDetailPage,
                                            arguments: key,
                                          ).then((value) async {
                                            ref
                                                    .read(recomendationsProvider
                                                        .notifier)
                                                    .state =
                                                await getRecomendations();
                                            setItensByCategoryWith(_term);
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.library_books_sharp,
                                              size: 40,
                                              color: Colors.black,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: 200,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      doc.title,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      doc.description,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Spacer(flex: 1),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6.0, right: 8.0),
                                              child: Text(
                                                  "${AppLocalizations.of(context)!.mark}: ${ClampedAverageCalculator.calculate(doc.ratings.map((e) => e.rate).toList()).toInt()}"),
                                            ),
                                            StarRating(
                                              onRating: (rating) {},
                                              rating: ClampedAverageCalculator
                                                      .calculate(doc.ratings
                                                          .map((e) => e.rate)
                                                          .toList())
                                                  .toInt(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
