import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CargicMap extends StatefulWidget {
  const CargicMap({
    Key key,
    this.initialCameraPosition,
  }) : super(key: key);
  final CameraPosition initialCameraPosition;
  @override
  _CargicMapState createState() => _CargicMapState();
}

class _CargicMapState extends State<CargicMap> {
  Completer<GoogleMapController> _completer = Completer();
  GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      padding: EdgeInsets.only(bottom: 0),
      initialCameraPosition: (widget.initialCameraPosition != null)
          ? widget.initialCameraPosition
          : CameraPosition(
              target: LatLng(0.12, 2.5),
            ),
      onMapCreated: (GoogleMapController controller) {
        _completer.complete(controller);
        _googleMapController = controller;
      },
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
