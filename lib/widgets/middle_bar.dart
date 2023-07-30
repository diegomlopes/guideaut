import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guideaut/common/widgets/clickable.dart';
import 'package:guideaut/providers/locale_provider.dart';
import 'package:guideaut/routes/routes.dart';
import 'package:guideaut/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MiddleBar extends StatelessWidget {
  const MiddleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, WidgetRef ref, __) {
      return Column(
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
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.signin),
                          style: middleButtonStyle,
                          child: Row(
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
                              Text(AppLocalizations.of(context)!.signin),
                              const Icon(
                                Icons.account_circle,
                                color: textPrimary,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
