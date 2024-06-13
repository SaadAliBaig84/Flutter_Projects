import 'package:app_seven/providers/user_places.dart';
import 'package:app_seven/screens/new_place.dart';
import 'package:app_seven/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Places extends ConsumerStatefulWidget {
  const Places({super.key});
  @override
  ConsumerState<Places> createState() {
    return PlacesState();
  }
}

class PlacesState extends ConsumerState<Places> {
  late Future<void> _futurePlaces;
  void newPlace(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NewPlace()));
  }

  @override
  void initState() {
    super.initState();
    _futurePlaces = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final placesList = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                newPlace(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _futurePlaces,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : PlacesList(list: placesList),
        ),
      ),
    );
  }
}
