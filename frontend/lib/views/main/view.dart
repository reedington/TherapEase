part of 'controller.dart';

class MainView extends StatelessView<MainScreen, MainController> {
  const MainView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: AppColor.brandColor,
        height: kBottomNavigationBarHeight.h,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgIcon(
              svg: AppSvg.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Wellness',
            icon: SvgIcon(
              svg: AppSvg.physicalTherapy,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Community',
            icon: SvgIcon(
              svg: AppSvg.userGroup,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Nexus',
            icon: SvgIcon(
              svg: AppSvg.users,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Resources',
            icon: SvgIcon(
              svg: AppSvg.bookOpen,
            ),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return const CupertinoPageScaffold(
            child: CommunityScreen(),
            // child: SignalingScreen(),
          );
        } else if (index == 1) {
          return const CupertinoPageScaffold(
            child: CommunityScreen(),
            // child: SignalingScreen2(),
          );
        } else if (index == 2) {
          return const CupertinoPageScaffold(
            child: CommunityScreen(),
          );
        } else if (index == 3) {
          return const CupertinoPageScaffold(
            child: CommunityScreen(),
          );
        } else {
          return const CupertinoPageScaffold(
            child: ResourcesScreen(),
          );
        }
      },
    );
  }
}
