import 'dart:async';

import "package:auto_route/auto_route.dart";
import 'package:commerce/src/routes/routes.gr.dart';
import 'package:commerce/src/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectToCheckStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppAssets.logo,
          height: 245,
          width: 245,
        ),
      ),
    );
  }

  void redirectToCheckStatus() {
    Timer(const Duration(seconds: 2), () {
      context.router.replace(CheckStatusScreenRoute());
    });
  }
}
