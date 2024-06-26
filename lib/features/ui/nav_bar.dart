import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/pages/favourite_page/favourite_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/houses_page/houses_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/information_center_page/information_center_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/profile_page/profile_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/report_page/report_page.dart';
import 'package:bhc_mobile_app/features/ui/widgets/close_app_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  static const routeName = 'navbar';

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return CloseAppObserver(
      child: Scaffold(
        // appBar: _GeneralAppBar(controller),
        bottomNavigationBar: StylishBottomBar(
          currentIndex: currentIndex,
          backgroundColor: AppColors.whiteInActive,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              controller.jumpToPage(index);
            });
          },
          items: [
            BottomBarItem(
              selectedIcon: SvgPicture.asset(
                IconAssetsPaths.houses,
                color: AppColors.brand,
              ),
              icon: SvgPicture.asset(IconAssetsPaths.houses),
              title: Text(
                'Real Estate',
                style: AppTextStyles.s14w500.apply(color: AppColors.brand),
              ),
              backgroundColor: AppColors.white,
              // selectedIcon: const Icon(Icons.read_more),
            ),
            BottomBarItem(
              icon: SvgPicture.asset(IconAssetsPaths.bookmarks),
              selectedIcon: SvgPicture.asset(
                IconAssetsPaths.inquiry,
                color: AppColors.brand,
              ),
              title: Text(
                'Favourites',
                style: AppTextStyles.s14w500.apply(color: AppColors.brand),
              ),
              backgroundColor: AppColors.white,
            ),
            BottomBarItem(
              icon: SvgPicture.asset(IconAssetsPaths.inquiry),
              selectedIcon: SvgPicture.asset(
                IconAssetsPaths.inquiry,
                color: AppColors.brand,
              ),
              title: Text(
                'Info',
                style: AppTextStyles.s14w500.apply(color: AppColors.brand),
              ),
              backgroundColor: AppColors.white,
            ),
            BottomBarItem(
              icon: SvgPicture.asset(IconAssetsPaths.maintenance),
              selectedIcon: SvgPicture.asset(
                IconAssetsPaths.maintenance,
                color: AppColors.brand,
              ),
              title: Text(
                'Maintenance',
                style: AppTextStyles.s14w500.apply(color: AppColors.brand),
              ),
              backgroundColor: AppColors.white,
            ),
            BottomBarItem(
              icon: SvgPicture.asset(IconAssetsPaths.profile),
              selectedIcon: SvgPicture.asset(
                IconAssetsPaths.inquiry,
                color: AppColors.brand,
              ),
              title: Text(
                'Profile',
                style: AppTextStyles.s14w500.apply(color: AppColors.brand),
              ),
              backgroundColor: AppColors.white,
            ),
          ],
          option: BubbleBarOptions(
            barStyle: BubbleBarStyle.horizontal,
            iconSize: 24,
          ),
        ),
        body: PageView(
          controller: controller,
          children: [
            HousesPage(),
            FavouritePage(),
            InformationCenter(),
            ReportPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
