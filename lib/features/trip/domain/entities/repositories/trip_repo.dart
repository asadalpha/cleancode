import 'package:travelapp/features/trip/domain/entities/trip.dart';

abstract class TripReposotories {
  Future<List<Trip>> getTrips();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);

}
