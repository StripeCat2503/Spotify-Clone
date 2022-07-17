import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/src/core/screens/main_screen.dart';

part 'main_screen_provider.freezed.dart';

class MainScreenProvider extends StateNotifier<MainScreenState> {
  MainScreenProvider(super.state);

  void changeTab(MainScreenTab tab) {
    state = state.copyWith(tab: tab);
  }
}

final mainScreenProvider =
    StateNotifierProvider<MainScreenProvider, MainScreenState>((ref) {
  const initialState = MainScreenState();
  return MainScreenProvider(initialState);
});

@freezed
class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    @Default(MainScreenTab.home) MainScreenTab tab,
  }) = _MainScreenState;
}
