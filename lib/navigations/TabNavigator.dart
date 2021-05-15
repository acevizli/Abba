import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Profile/ProfilePage.dart';
import 'package:flutter_appp/Search/search_username.dart';
import 'package:flutter_appp/feed_screen.dart';
import 'package:flutter_appp/login_screen.dart';
import 'package:flutter_appp/notifications/notification_screen.dart';
import '../Classes.dart';
import 'BottomNavbarItem.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavbarItem item;

  const TabNavigator({
    Key key,
    @required this.navigatorKey,
    @required this.item, this.analytics, this.observer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders();
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
            builder: (context) => routeBuilders[initialRoute](context),
          )
        ];
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders() {
    return {tabNavigatorRoot: (context) => _getScreen(context, item)};
  }

  Widget _getScreen(BuildContext context, BottomNavbarItem item) {
    switch (item) {
      case BottomNavbarItem.Main:
        return FeedScreen(analytics: analytics, observer: observer,);
      case BottomNavbarItem.Create:
        return Scaffold();
      case BottomNavbarItem.Profile:
        return ViewProfileScreen(user: users[0],analytics: analytics,observer: observer,);
      case BottomNavbarItem.Search:
        return Search(analytics: analytics,observer: observer,);
      case BottomNavbarItem.DM:
        return Scaffold();
      case BottomNavbarItem.Notifications:
        return NotificationScreen(analytics: analytics,observer: observer,);
      default:
        return Scaffold();
    }
  }
}