import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yatra/features/feature_explore/model/state_model.dart';

import 'features/feature_home/ui/home.dart';
import 'features/feature_state/model/location_model.dart';
import 'features/feature_statelocation_details/model/visitorInfo_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(StateModelAdapter());
  Hive.registerAdapter(StateLocationAdapter());
  Hive.registerAdapter(VisitorInformationAdapter());

  //await Hive.openBox<StateModel>('statesBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

