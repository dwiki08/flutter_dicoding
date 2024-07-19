import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacemarkView extends StatelessWidget {
  const PlacemarkView({
    super.key,
    required this.placemark,
    required this.latLng,
    required this.showChooseButton,
    this.onChooseButton,
  });

  final geo.Placemark placemark;
  final LatLng latLng;
  final bool showChooseButton;
  final Function(LatLng latLng)? onChooseButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: showChooseButton ? 172 : 128,
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 16,
            offset: Offset.zero,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    placemark.street! + placemark.street!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}',
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          Visibility(
              visible: showChooseButton,
              child: ElevatedButton.icon(
                icon: SvgPicture.asset(
                  assetsIcons('ic_pin_map.svg'),
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  if (onChooseButton != null) {
                    onChooseButton!(latLng);
                  }
                },
                label: Text(AppLocalizations.of(context)!.choose),
              ))
        ],
      ),
    );
  }
}
