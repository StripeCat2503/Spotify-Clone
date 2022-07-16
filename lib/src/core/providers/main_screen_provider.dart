import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/src/core/providers/base_provider.dart';
import 'package:spotify_clone/src/core/screens/main_screen.dart';

class MainScreenProvider extends BaseProvider {
  MainScreenTab tab = MainScreenTab.home;

  void changeTab(MainScreenTab tab) {
    this.tab = tab;
    notifyListeners();
  }

  @override
  void refresh() {}
}

final mainScreenProvider = ChangeNotifierProvider((ref) {
  return MainScreenProvider();
});
