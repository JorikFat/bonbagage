import 'package:flutter/material.dart';

class SimpleRouteInformationParser extends RouteInformationParser<Object> {
  @override
  Future<Object> parseRouteInformation(RouteInformation routeInformation) async {
    return Object(); // Для простоты, игнорируем URL
  }

  @override
  RouteInformation? restoreRouteInformation(Object configuration) {
    return RouteInformation(uri: Uri.parse('/'));
  }
}