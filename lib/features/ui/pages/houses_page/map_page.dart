part of 'package:bhc_mobile_app/features/ui/pages/houses_page/houses_page.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  final MapController controller = MapController(
    initPosition: GeoPoint(
      latitude: 47.4358055,
      longitude: 8.4737324,
    ),
    // areaLimit: BoundingBox(
    //   east: 10.4922941,
    //   north: 47.8084648,
    //   south: 45.817995,
    //   west: 5.9559113,
    // ),
  );

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
        controller: controller,
        osmOption: OSMOption(
          zoomOption: ZoomOption(
            initZoom: 5,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          roadConfiguration: RoadOption(
            roadColor: Colors.yellowAccent,
          ),
          // markerOption: MarkerOption(
          //     defaultMarker: MarkerIcon(
          //       icon: Icon(
          //         Icons.person_pin_circle,
          //         color: Colors.blue,
          //         size: 56,
          //       ),
          //     )
          // ),
        ));
  }
}
