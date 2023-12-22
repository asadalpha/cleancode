import 'package:hive/hive.dart';

import '../trip_model.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;
  TripLocalDataSource(this.tripBox);
  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  deleteTrip(int index) {
    tripBox.delete(index);
  }
}
