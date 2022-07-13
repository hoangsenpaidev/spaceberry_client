import 'package:flutter/material.dart';

import 'resources/theme/theme.dart';
import 'resources/views/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enma',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: const SplashScreen(),
    );
  }
}
