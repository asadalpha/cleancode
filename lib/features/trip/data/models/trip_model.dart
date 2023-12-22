import 'package:hive/hive.dart';

import '../../domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String location;
  @HiveField(2)
  final List<String> photos;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final DateTime date;

  TripModel(
      {required this.title,
      required this.photos,
      required this.description,
      required this.date,
      required this.location});

  // entity to model
  factory TripModel.fromEntitiy(Trip trip) => TripModel(
        title: trip.title,
        photos: trip.photos,
        description: trip.description,
        date: trip.date,
        location: trip.location,
      );

  // model to entity
  Trip toEntity() {
    return Trip(
        title: title,
        photos: photos,
        description: description,
        date: date,
        location: location);
  }
}
