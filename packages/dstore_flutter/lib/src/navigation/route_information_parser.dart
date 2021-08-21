import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DStoreRouteInformationParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(routeInformation.location ?? "");
  }
}
