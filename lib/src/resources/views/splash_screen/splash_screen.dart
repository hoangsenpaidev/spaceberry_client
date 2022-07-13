import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/read_shared_pref.dart';
import '../auth/sign_in_screen/sign_in_screen.dart';
import '../overview/overview.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int seconds = 2;

  @override
  void initState() {
    checkLogin();

    super.initState();
  }

  void checkLogin() async {
    bool isValid = await ReadSharedPref().read('uid') == null;
    Timer(Duration(seconds: seconds), () {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
              builder: (BuildContext context) =>
                  !isValid ? const OverView() : const SignInScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 170,
          height: 170,
          child: Image.asset(
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? "assets/images/light-logo.png"
                : "assets/images/dark-logo.png",
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
