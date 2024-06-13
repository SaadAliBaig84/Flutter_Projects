import 'package:app_seven/models/place.dart';
import 'package:app_seven/screens/map.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key, required this.place});
  final Place place;
  String get locationImage {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=${place.placeLocation.latitude},${place.placeLocation.longitude}&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C${place.placeLocation.latitude},${place.placeLocation.longitude}&key=AIzaSyChjOocppPFdgmkV5CIbZ82_GWroVz6p9M';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.name)),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(locationImage),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => MapScreen(
                              location: place.placeLocation,
                              isSelecting: false,
                            ))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                    alignment: Alignment.center,
                    child: Text(
                      place.placeLocation.address,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
