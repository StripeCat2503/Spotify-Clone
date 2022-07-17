import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/providers/main_screen_provider.dart';
import 'package:spotify_clone/src/core/screens/base_screen.dart';
import 'package:spotify_clone/src/modules/home/screens/home_screen.dart';
import 'package:spotify_clone/src/modules/search/screens/search_screen.dart';
import 'package:spotify_clone/src/modules/your_library/screens/your_library_screen.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainScreenProvider);
    final provider = ref.read(mainScreenProvider.notifier);

    return BaseScreen(
      child: Scaffold(
        appBar: AppBar(),
        body: state.tab.asPage,
        bottomNavigationBar: _buildBottomNavBar(state, provider),
      ),
    );
  }

  Widget _buildBottomNavBar(
    MainScreenState state,
    MainScreenProvider provider,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: 32.w,
        right: 32.w,
        top: 15.h,
        bottom: 15.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: MainScreenTab.values.map((tab) {
          return InkWell(
            onTap: () => provider.changeTab(tab),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                tab.bottomIcon(isActive: tab == state.tab),
                SizedBox(
                  height: 5.h,
                ),
                tab.bottomTitle(isActive: tab == state.tab),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

enum MainScreenTab {
  home,
  search,
  library,
}

extension _MainScreenTabX on MainScreenTab {
  Widget get asPage {
    switch (this) {
      case MainScreenTab.home:
        return const HomeScreen();
      case MainScreenTab.search:
        return const SearchScreen();
      case MainScreenTab.library:
        return const YourLibraryScreen();
    }
  }

  Widget bottomIcon({bool isActive = false}) {
    String path;
    switch (this) {
      case MainScreenTab.home:
        path = Assets.icons.svg.home.path;
        break;
      case MainScreenTab.search:
        path = Assets.icons.svg.search.path;
        break;
      case MainScreenTab.library:
        path = Assets.icons.svg.library.path;
        break;
    }

    return SvgPicture.asset(
      path,
      color: isActive ? ColorName.white : ColorName.greyLight,
    );
  }

  Widget bottomTitle({bool isActive = false}) {
    String title;
    switch (this) {
      case MainScreenTab.home:
        title = 'Home';
        break;
      case MainScreenTab.search:
        title = 'Search';
        break;
      case MainScreenTab.library:
        title = 'Your Library';
        break;
    }

    return Text(
      title,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: isActive ? ColorName.white : ColorName.greyLight,
      ),
    );
  }
}
