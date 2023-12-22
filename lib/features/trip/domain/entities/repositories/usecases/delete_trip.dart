import 'package:travelapp/features/trip/domain/entities/repositories/trip_repo.dart';

import '../../trip.dart';

class DeleteTrip {
  final TripReposotories repository;

  DeleteTrip(this.repository);

  Future<void> call(int index) {
    return repository.deleteTrip(index);
  }
}
