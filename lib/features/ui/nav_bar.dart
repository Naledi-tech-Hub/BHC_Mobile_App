import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/features/ui/widgets/close_app_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const List<String> _navBarIcons = [
  IconAssetsPaths.analyse,
  //IconAssetsPaths.explore,
  // IconAssetsPaths.construct,
  //IconAssetsPaths.profile,
];

const List<String> _navBarInactiveIcons = [
  IconAssetsPaths.analyseInactive,
  //IconAssetsPaths.exploreInactive,
  // IconAssetsPaths.constructInactive,
  //IconAssetsPaths.profileInactive,
];

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  static const routeName = 'navbar';


  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: _navBarIcons.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _NavBarBody(controller);
}


class _NavBarBody extends StatelessWidget {
  const _NavBarBody(this.controller);

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return CloseAppObserver(
      child: Scaffold(
          extendBody: true,
         // appBar: _GeneralAppBar(controller),
          bottomNavigationBar: _BottomNavBar(controller),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: const [
              //AnalysePage(),
              //ExplorePage(),
              // ConstructPage(),
              //ProfilePage(),
            ],
          ),
        ),
    );
  }
}

class _BottomNavBar extends StatefulWidget {
  const _BottomNavBar(this.controller);

  final TabController controller;

  @override
  State<_BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.secondary5))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: Sizes.p10),
        child: TabBar(
          controller: widget.controller,
          tabs: List.generate(
            _navBarIcons.length,
                (index) => GestureDetector(
              onTap: () => widget.controller.animateTo(index),
              child: Tab(
                text: 'tabs.$index'.tr(),
                iconMargin: const EdgeInsets.only(bottom: Sizes.p4),
                icon: SvgPicture.asset(
                  widget.controller.index == index
                      ? _navBarIcons[index]
                      : _navBarInactiveIcons[index],
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
