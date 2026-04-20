import 'package:flutter/material.dart';
import 'package:bonbagage/router/app_router.dart';
import 'package:bonbagage/router/nav_state.dart';
import 'package:bonbagage/router/route_parser.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navState = NavState();
    final routerDelegate = AppRouterDelegate(navState);

    return ChangeNotifierProvider<NavState>(
      create: (_) => navState,
      child: MaterialApp.router(
        title: 'BonBagage',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerDelegate: routerDelegate,
        routeInformationProvider: PlatformRouteInformationProvider(
          initialRouteInformation: RouteInformation(
            uri: Uri.parse('/'),
          ),
        ),
        routeInformationParser: SimpleRouteInformationParser(),
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}