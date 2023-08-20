import 'package:guideaut/pages/admin_panel_page.dart';
import 'package:riverpod/riverpod.dart';

final StateProvider<PanelOptions> optionSelectedProvider =
    StateProvider<PanelOptions>(
  (StateProviderRef<PanelOptions> ref) => PanelOptions.userRecomendation,
);
