import 'package:travelapp/features/trip/domain/entities/repositories/trip_repo.dart';

import '../../trip.dart';

class GetTrip {
  final TripReposotories repository;

  GetTrip(this.repository);

  Future<List<Trip>> call() {
    return repository.getTrips();
  }
}
