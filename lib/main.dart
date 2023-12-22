import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'features/trip/data/models/trip_model.dart';
import 'features/trip/presentation/providers/widgets/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize hive-->
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(TripModelAdapter());
  await Hive.openBox<TripModel>('trips');
  runApp( ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Travel App",
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
