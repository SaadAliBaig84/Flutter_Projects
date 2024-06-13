import 'dart:io';

import 'package:app_seven/models/place.dart';
import 'package:app_seven/providers/user_places.dart';
import 'package:app_seven/widgets/image_input.dart';
import 'package:app_seven/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});
  @override
  ConsumerState<NewPlace> createState() {
    return NewPlaceState();
  }
}

class NewPlaceState extends ConsumerState<NewPlace> {
  final TextEditingController _placeName = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;
  void _savePlace() {
    final enteredName = _placeName.text;
    if (enteredName.trim().isEmpty || _selectedImage == null || _selectedLocation == null) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredName, _selectedImage!, _selectedLocation!);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _placeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place.'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.name,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Enter place: '),
                  labelStyle: TextStyle(fontSize: 20),
                ),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
                controller: _placeName,
              ),
              const SizedBox(
                height: 15,
              ),
              ImageInput(onPickImage: (image) {
                _selectedImage = image;
              }),
              const SizedBox(
                height: 15,
              ),
              LocationInput(
                onSelectLocation: (location) {
                  _selectedLocation = location;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add place'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
