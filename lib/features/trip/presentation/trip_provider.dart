import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:travelapp/features/trip/data/models/datasources/trip_local_datasourec.dart';
import 'package:travelapp/features/trip/data/repositories/trip_repo_implement.dart';
import 'package:travelapp/features/trip/domain/entities/repositories/usecases/get_trips.dart';
import '../data/models/trip_model.dart';
import '../domain/entities/repositories/usecases/add_trip.dart';
import '../domain/entities/repositories/usecases/delete_trip.dart';
import '../domain/entities/trip.dart';

final TripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');

  return TripLocalDataSource(tripBox);
});

final TripRepositoryProvider = Provider<TripRepositoriesimpl>((ref) {
  final localDataSource = ref.read(TripLocalDataSourceProvider);

  return TripRepositoriesimpl(localDataSource);
});

final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(TripRepositoryProvider);

  return AddTrip(repository);
});

final getTripProvider = Provider<GetTrip>((ref) {
  final repository = ref.read(TripRepositoryProvider);

  return GetTrip(repository);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(TripRepositoryProvider);

  return DeleteTrip(repository);
});

final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripProvider);
  final addTrip = ref.read(getTripProvider);
  final deleteTrip = ref.read(getTripProvider);
// correction by cadt
  return TripListNotifier(
      getTrips, addTrip as AddTrip, deleteTrip as DeleteTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrip _getTrips;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._deleteTrip) : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
  }

  Future<void> removeTrip(int tripId) async {
    await _deleteTrip(tripId);
  }

  Future<void> loadTrips() async {
    await _getTrips();
  }
}
