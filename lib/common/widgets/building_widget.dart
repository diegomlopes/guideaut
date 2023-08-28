import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guideaut/theme/theme.dart';

class BuildingWidget extends StatelessWidget {
  const BuildingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 300,
      child: Center(
        child: Column(
          children: [
            const Spacer(flex: 2),
            const Icon(Icons.sim_card_alert_outlined, size: 50),
            const Spacer(),
            Text(
              AppLocalizations.of(context)!.page_in_development,
              style: imageHomeTitleTextStyle,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
