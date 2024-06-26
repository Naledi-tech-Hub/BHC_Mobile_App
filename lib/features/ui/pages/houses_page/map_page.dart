part of 'package:bhc_mobile_app/features/ui/pages/houses_page/houses_page.dart';

final markers = [
  const Marker(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      point: LatLng(-24.653357, 25.906792),
      child: _MarkerIcon()),
  const Marker(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      point: LatLng(-24.653257, 25.906792),
      child: _MarkerIcon()),
];

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final PopupController _popupController = PopupController();

  @override
  Widget build(BuildContext context) {
    return PopupScope(
      popupController: _popupController,
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-24.653257, 25.906792),
          initialZoom: 16,
        ),
        children: [
          TileLayer(
            minNativeZoom: 6,
            maxNativeZoom: 19,
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'bw.bhc.app',
          ),
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              spiderfyCircleRadius: 80,
              spiderfySpiralDistanceMultiplier: 2,
              circleSpiralSwitchover: 12,
              maxClusterRadius: 120,
              rotate: true,
              size: const Size(40, 40),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(50),
              maxZoom: 15,
              markers: markers,
              polygonOptions: const PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3,
              ),
              popupOptions: PopupOptions(
                popupSnap: PopupSnap.markerTop,
                popupController: _popupController,
                popupBuilder: (_, marker) => Container(
                  width: 200,
                  height: 100,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () => debugPrint('Popup tap!'),
                    child: const Text(
                      'Container popup for marker',
                    ),
                  ),
                ),
              ),
              builder: (context, markers) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      markers.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
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
