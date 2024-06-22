part of 'package:bhc_mobile_app/features/ui/pages/houses_page/houses_page.dart';

final points = [
  StaticPositionGeoPoint(
    '0',
    const MarkerIcon(iconWidget: _MarkerIcon()),
    [
      GeoPoint(latitude: -24.653257, longitude: 25.906792),
    ],
  ),
];

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin {
  final MapController controller = MapController(
    initPosition: GeoPoint(
      latitude: -24.653257,
      longitude: 25.906792,
    ),
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return OSMFlutter(
      controller: controller,
      mapIsLoading: const LoadingIndicator(),
      //onMapIsReady: ,
      osmOption: OSMOption(
        zoomOption: const ZoomOption(
          initZoom: 16,
          minZoomLevel: 8,
          maxZoomLevel: 17,
        ),

        // roadConfiguration: const RoadOption(
        //   roadColor: Colors.yellowAccent,
        // ),
        staticPoints: points,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _MarkerIcon extends StatelessWidget {
  const _MarkerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.brand,
      ),
      child: Container(
        height: 12,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
      ),
    );
  }
}
