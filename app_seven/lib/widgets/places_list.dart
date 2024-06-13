import 'package:app_seven/models/place.dart';
import 'package:app_seven/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  final List<Place> list;
  const PlacesList({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(
            child: Text(
              'No places added yet.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: FileImage(list[index].image),
                ),
                title: Text(list[index].name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => PlaceDetails(place: list[index])));
                },
                subtitle: Text(
                  list[index].placeLocation.address,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              );
            },
            itemCount: list.length,
          );
  }
}
