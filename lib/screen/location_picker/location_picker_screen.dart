import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/placemark_view.dart';
import 'package:dicoding_flutter/routes/page_manager.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:dicoding_flutter/utils/request_permission.dart';
import 'package:dicoding_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key, required this.onPickLocation});

  final Function(LatLng latLng) onPickLocation;

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  late GoogleMapController mapController;

  final defaultLocation = const LatLng(-6.175392, 106.827153);
  final Set<Marker> markers = {};
  MapType selectedMapType = MapType.normal;
  geo.Placemark? placemark;

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
          const SizedBox(height: defaultPadding / 2),
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

  mapTypeControls() {
    return Positioned(
      top: 16,
      left: 16,
      child: FloatingActionButton.small(
        onPressed: null,
        child: PopupMenuButton<MapType>(
          onSelected: (MapType item) {
            setState(() {
              selectedMapType = item;
            });
          },
          offset: const Offset(0, 54),
          icon: const Icon(Icons.layers_outlined),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<MapType>>[
            const PopupMenuItem<MapType>(
              value: MapType.normal,
              child: Text('Normal'),
            ),
            const PopupMenuItem<MapType>(
              value: MapType.satellite,
              child: Text('Satellite'),
            ),
            const PopupMenuItem<MapType>(
              value: MapType.terrain,
              child: Text('Terrain'),
            ),
            const PopupMenuItem<MapType>(
              value: MapType.hybrid,
              child: Text('Hybrid'),
            ),
          ],
        ),
      ),
    );
  }

  myLocationButton() {
    return Positioned(
      bottom: 200,
      right: 16,
      child: FloatingActionButton.small(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.my_location,
          color: Colors.blueAccent,
        ),
        onPressed: () => onMyLocationButtonPress(),
      ),
    );
  }

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

  void onLongPressGoogleMap(LatLng latLng) async {
    final place = await getPlacemark(latLng);
    setState(() {
      placemark = place;
    });

    defineMarker(latLng);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void onMyLocationButtonPress() async {
    final isPermissionGranted = await RequestPermission.requestUserLocation();
    if (!isPermissionGranted) return;

    final Location location = Location();
    late LocationData locationData;
    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    final place = await getPlacemark(latLng);
    setState(() {
      placemark = place;
    });

    defineMarker(latLng);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localize.chooseLocation),
      ),
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: defaultLocation, zoom: 18),
              onMapCreated: (controller) async {
                defineMarker(defaultLocation);
                final place = await getPlacemark(LatLng(
                    defaultLocation.latitude, defaultLocation.longitude));
                setState(() {
                  placemark = place;
                  mapController = controller;
                });
              },
              onLongPress: (latLng) => onLongPressGoogleMap(latLng),
              markers: markers,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              mapType: selectedMapType,
            ),
            zoomControls(),
            mapTypeControls(),
            myLocationButton(),
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
                  showChooseButton: true,
                  onChooseButton: (latLng) {
                    widget.onPickLocation(latLng);
                    context.read<PageManager>().returnResult((result: PageResult.ok, data: latLng));
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
