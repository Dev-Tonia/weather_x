import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/locator_setup.dart';
import 'package:weather_app/utils/provider_setup.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  locatorSetup();
  runApp(MultiProvider(providers: providers, child: const MyApp()));

  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
