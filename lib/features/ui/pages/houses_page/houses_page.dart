import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

part 'package:bhc_mobile_app/features/ui/pages/houses_page/map_page.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({super.key});

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapPage(),
        //Positioned.fill(child: SizedBox()),
      ],
    );
  }
}
