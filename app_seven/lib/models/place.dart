import 'dart:io';

import 'package:uuid/uuid.dart';

const idGenerator = Uuid();

class PlaceLocation {
  final double longitude;
  final double latitude;
  final String address;
  const PlaceLocation(
      {required this.address, required this.latitude, required this.longitude});
}

class Place {
  final String name;
  final String id;
  final File image;
  final PlaceLocation placeLocation;
  Place({
    required this.name,
    required this.image,
    required this.placeLocation,
    id,
  }) : id = id ?? idGenerator.v4();
}
