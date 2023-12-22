import 'package:travelapp/features/trip/domain/entities/repositories/trip_repo.dart';

import '../../trip.dart';

class AddTrip {
  final TripReposotories repository;

  AddTrip(this.repository);

  Future<void> call(Trip trip)  {
    return repository.addTrip(trip);
  }
}
