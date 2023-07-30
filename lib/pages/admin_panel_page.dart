import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guideaut/common/widgets/custom_card.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/features/admin_panel/recomendations/presentation/user_recomendations.dart';
import 'package:guideaut/features/auth/domain/entities/enuns/user_roles.dart';
import 'package:guideaut/features/auth/domain/entities/user_entity.dart';
import 'package:guideaut/features/auth/domain/usecases/get_logged_user.dart';
import 'package:guideaut/features/auth/domain/usecases/signout.dart';
import 'package:guideaut/providers/user_provider.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/styles.dart';
import 'package:guideaut/widgets/footer.dart';
import 'package:guideaut/widgets/menu_bar.dart';
import 'package:guideaut/widgets/middle_bar.dart';
import 'package:responsive_ui/responsive_ui.dart';

class AdminPanelPage extends ConsumerStatefulWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends ConsumerState<AdminPanelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MiddleBar(),
            const MenuTopBar(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // color: const Color(0xff1167b1),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        children: [
                          Text(
                            "Admin Panel",
                            style: imageHomeTitleTextStyle,
                          ),
                          TextButton(
                            onPressed: () async {
                              final useCase = SignOut();
                              final _ = await useCase(NoParams());
                              ref.read(loggedUserProvider.notifier).state =
                                  null;

                              Navigator.pushNamed(context, Routes.home);
                            },
                            child: const Text(
                              "Sair",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: _userLogged(),
                      builder: (BuildContext context,
                          AsyncSnapshot<UserEntity?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data == null) {
                            Navigator.pushNamed(context, Routes.signin);
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            final user = snapshot.data!;
                            var options = <PanelOption>[];

                            if (user.role == UserRoles.admin) {
                              options = _adminUserOptions();
                            } else {
                              options = _normalUserOptions();
                            }

                            return Center(
                              child: Responsive(
                                  children: options
                                      .map((e) => CustomCard(
                                            icon: e.icon,
                                            text: e.text,
                                            onPressed: () =>
                                                Navigator.pushNamed(
                                                    context, e.route),
                                          ))
                                      .toList()),
                            );
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ],
              ),
            ),
            const UserRecomendations(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  List<PanelOption> _adminUserOptions() {
    return [
      PanelOption(
        icon: Icons.supervised_user_circle,
        text: "Users",
        route: Routes.about,
      ),
      PanelOption(
        icon: Icons.recommend_rounded,
        text: "My Recomendations",
        route: Routes.about,
      ),
      PanelOption(
        icon: Icons.playlist_add,
        text: "My Projects",
        route: Routes.about,
      ),
    ];
  }

  List<PanelOption> _normalUserOptions() {
    return [
      PanelOption(
        icon: Icons.recommend_rounded,
        text: "My Recomendations",
        route: Routes.about,
      ),
      PanelOption(
        icon: Icons.playlist_add,
        text: "My Projects",
        route: Routes.about,
      ),
    ];
  }

  Future<UserEntity?> _userLogged() async {
    final getUser = GetLoggedUser();
    final loggedUserResult = await getUser(NoParams());

    if (loggedUserResult.isLeft()) return null;

    return loggedUserResult.getOrElse(() => null);
  }
}

class PanelOption {
  PanelOption({
    required this.icon,
    required this.text,
    required this.route,
  });

  final IconData icon;
  final String text;
  final String route;
}
