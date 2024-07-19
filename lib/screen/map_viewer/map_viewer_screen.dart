import 'package:dicoding_flutter/components/placemark_view.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:dicoding_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewerScreen extends StatefulWidget {
  const MapViewerScreen({super.key, required this.latLng});

  final LatLng latLng;

  @override
  State<MapViewerScreen> createState() => _MapViewerScreenState();
}

class _MapViewerScreenState extends State<MapViewerScreen> {
  late GoogleMapController mapController;
  final Set<Marker> markers = {};
  MapType selectedMapType = MapType.normal;
  geo.Placemark? placemark;

  Future<void> defineMarker(LatLng latLng) async {
    final place = await getPlacemark(latLng);
    final street = place?.street;
    final address =
        '${place?.subLocality}, ${place?.locality}, ${place?.postalCode}, ${place?.country}';
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }

  zoomControls() {
    return Positioned(
      top: 16,
      right: 16,
      child: Column(
        children: [
          FloatingActionButton.small(
            backgroundColor: Colors.white,
            heroTag: "zoom-in",
            onPressed: () {
              mapController.animateCamera(
                CameraUpdate.zoomIn(),
              );
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.small(
            backgroundColor: Colors.white,
            heroTag: "zoom-out",
            onPressed: () {
              mapController.animateCamera(
                CameraUpdate.zoomOut(),
              );
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.location),
      ),
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: widget.latLng, zoom: 18),
              onMapCreated: (controller) async {
                defineMarker(widget.latLng);
                final place = await getPlacemark(
                    LatLng(widget.latLng.latitude, widget.latLng.longitude));
                setState(() {
                  placemark = place;
                  mapController = controller;
                });
              },
              markers: markers,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
            ),
            zoomControls(),
            if (placemark == null)
              const SizedBox()
            else
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: PlacemarkView(
                  placemark: placemark!,
                  latLng: markers.first.position,
                  showChooseButton: false,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
