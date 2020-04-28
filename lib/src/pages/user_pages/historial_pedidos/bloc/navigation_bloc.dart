import 'dart:async';

class NavigationDrawerBloc {
  final navigationController = StreamController.broadcast();
  NavigationProvider navigationProvider = new NavigationProvider();

  Stream get getNavigation => navigationController.stream;

  void updateNavigation(String navigation) {
    navigationProvider.updateNavigation(navigation);
    navigationController.sink.add(navigationProvider.currentNavigation);
  }

  void dispose() {
    navigationController.close();
  }
}

final blocNav = NavigationDrawerBloc();


class NavigationProvider {
  String currentNavigation = "Historial";

  void updateNavigation(String navigation) {
    currentNavigation = navigation;
  }
}