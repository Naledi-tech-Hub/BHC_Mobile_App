import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'dart:ui' as ui;

part 'package:bhc_mobile_app/features/ui/pages/houses_page/map_page.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({super.key});

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        forceMaterialTransparency: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(Sizes.p48),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(Sizes.p999),
            ),
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: TabBar(
                controller: controller,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.p999),
                  color: AppColors.brand,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'List'),
                  Tab(text: 'Map'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          SizedBox(),
          MapPage(),
        ],
      ),
    );
  }
}
