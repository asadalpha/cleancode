import 'package:travelapp/features/trip/data/models/datasources/trip_local_datasourec.dart';
import 'package:travelapp/features/trip/data/models/trip_model.dart';
import 'package:travelapp/features/trip/domain/entities/trip.dart';

import '../../domain/entities/repositories/trip_repo.dart';

class TripRepositoriesimpl implements TripReposotories {
  final TripLocalDataSource localDataSource;

  TripRepositoriesimpl(this.localDataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntitiy(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    localDataSource.deleteTrip(index);
  }

  @override
  Future<List<Trip>> getTrips() async {
    final tripModels = localDataSource.getTrips();
    List<Trip> res = tripModels.map((model) => model.toEntity()).toList();
    return res;
  }
}
