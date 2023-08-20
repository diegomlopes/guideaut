import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:guideaut/core/no_params.dart';
import 'package:guideaut/features/auth/domain/entities/user_entity.dart';
import 'package:guideaut/features/auth/domain/usecases/get_logged_user.dart';
import 'package:guideaut/providers/locale_provider.dart';
import 'package:guideaut/providers/user_provider.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MiddleBar extends ConsumerStatefulWidget {
  const MiddleBar({Key? key}) : super(key: key);

  @override
  ConsumerState<MiddleBar> createState() => _MiddleBarState();
}

class _MiddleBarState extends ConsumerState<MiddleBar> {
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

  @override
  Widget build(BuildContext context) {
    final _loggedUser = ref.watch(loggedUserProvider);

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Wrap(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Clickable(
                              onPressed: () => ref
                                  .read(localeProvider.notifier)
                                  .state = const Locale("pt", "BR"),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/brazil_flag.jpg",
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Clickable(
                              onPressed: () => ref
                                  .read(localeProvider.notifier)
                                  .state = const Locale("en", "US"),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/usa_flag.jpg",
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: TextButton(
                                onPressed: () => _loggedUser.isNull
                                    ? Navigator.pushNamed(
                                        context, Routes.signin)
                                    : Navigator.pushNamed(
                                        context, Routes.adminPanelPage),
                                child: Row(
                                  children: [
                                    Text(
                                      _loggedUser == null
                                          ? AppLocalizations.of(context)!.signin
                                          : _loggedUser.firstName ??
                                              _loggedUser.email,
                                      style: const TextStyle(
                                        color: textPrimary,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.account_circle,
                                      color: textPrimary,
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
