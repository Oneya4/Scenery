import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/models/place.dart';

class MapsScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapsScreen({
    this.initialLocation =
        const PlaceLocation(latitude: 37.422, longitude: -122.084),
    this.isSelecting = false,
  });

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Map'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            if (widget.isSelecting)
              IconButton(
                icon: Icon(Icons.check),
                onPressed: _pickedLocation == null
                    ? null
                    : () {
                        Navigator.of(context).pop(_pickedLocation);
                      },
              )
          ],
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.initialLocation.latitude!,
              widget.initialLocation.longitude!,
            ),
            zoom: 16,
          ),
          onTap: widget.isSelecting ? _selectLocation : null,
          markers: (_pickedLocation == null && widget.isSelecting)
              ? {}
              : {
                  Marker(
                    markerId: MarkerId('m1'),
                    position: _pickedLocation ??
                        LatLng(
                          widget.initialLocation.latitude!,
                          widget.initialLocation.longitude!,
                        ),
                  ),
                },
        ),
      ),
    );
  }
}
