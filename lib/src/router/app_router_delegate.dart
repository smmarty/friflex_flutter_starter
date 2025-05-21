import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  AppRouterDelegate({
    required GlobalKey<NavigatorState> navigatorKey,
    required Page homePage,
  })  : _navigatorKey = navigatorKey,
        _pages = [homePage];

  final GlobalKey<NavigatorState> _navigatorKey;

  late List<Page> _pages;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      restorationScopeId: 'rootNav',
      pages: _pages,
      onDidRemovePage: (page) {
        _pages = [..._pages]..remove(page);
        if (_pages.remove(page)) {
          notifyListeners();
        }
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(String configuration) {
    return SynchronousFuture(null);
  }
}
