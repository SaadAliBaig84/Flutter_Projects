import 'package:app_seven/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation location;
  final bool isSelecting;
  const MapScreen({
    super.key,
    this.location =
        const PlaceLocation(address: '', latitude: 37.422, longitude: -122.084),
    this.isSelecting = true,
  });
  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your location' : 'Your location'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(_pickedLocation);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: GoogleMap(
        onTap: !widget.isSelecting
            ? null
            : (argument) => setState(() {
                  _pickedLocation = argument;
                }),
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.latitude, widget.location.longitude),
          zoom: 16,
        ),
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                    markerId: const MarkerId('c4'),
                    position: _pickedLocation ??
                        LatLng(widget.location.latitude,
                            widget.location.longitude)),
              },
      ),
    );
  }
}
