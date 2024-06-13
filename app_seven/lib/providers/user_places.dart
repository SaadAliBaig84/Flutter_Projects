import 'dart:io';

import 'package:app_seven/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class UserPlacesNotifer extends StateNotifier<List<Place>> {
  UserPlacesNotifer() : super(const []);
  Future<Database> _getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)'),
      version: 1,
    );
    return db;
  }

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = data
        .map(
          (e) => Place(
            name: e['title'] as String,
            image: File(e['image'] as String),
            placeLocation: PlaceLocation(
                address: e['address'] as String,
                latitude: e['lat'] as double,
                longitude: e['lng'] as double),
            id: e['id'] as String,
          ),
        )
        .toList();
    state = places;
  }

  void addPlace(String title, File image, PlaceLocation placeLocation) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');
    final Place place =
        Place(name: title, image: copiedImage, placeLocation: placeLocation);
    final db = await _getDatabase();
    db.insert('user_places', {
      'id': place.id,
      'title': place.name,
      'image': place.image.path,
      'lat': place.placeLocation.latitude,
      'lng': place.placeLocation.longitude,
      'address': place.placeLocation.address
    });
    state = [...state, place];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifer, List<Place>>(
        (ref) => UserPlacesNotifer());
