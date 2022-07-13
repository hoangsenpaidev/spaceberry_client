import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {});
  runApp(
    const MyApp(), // Wrap your app
  );
}
