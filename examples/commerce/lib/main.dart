import 'dart:async';

import 'package:commerce/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // AppInjector.create();
    // Bloc.observer = MyBlocObserver();
    // Crashlytics.instance.enableInDevMode = false;
    // FlutterError.onError = CrashlyticsService.recordFlutterError;
    runApp(MyApp());
  }, (error, stack) {
    // CrashlyticsService.recordError(error, stack);
    print("Error in app");
  }, zoneSpecification: ZoneSpecification());
}
