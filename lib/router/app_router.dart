import 'package:flutter/material.dart';
import 'nav_state.dart';
import 'package:bonbagage/view/bags_view.dart';
import 'package:bonbagage/view/journeys_view.dart';

class AppRouterDelegate extends RouterDelegate<Object>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Object> {
  
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final NavState navState;

  AppRouterDelegate(this.navState) : navigatorKey = GlobalKey<NavigatorState>() {
    // Слушаем изменения в навигации
    navState.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        // Основной экран списка (всегда внизу стека)
        MaterialPage(
          key: const ValueKey('JourneysPage'),
          child: JourneysView()),
        if (navState.selectedJourneyId != null)
          MaterialPage(
            key: ValueKey(navState.selectedJourneyId),
            child: BagsView(),
          ),
      ],
      onDidRemovePage: (page) {
        navState.goBack();
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Object configuration) async {}
}