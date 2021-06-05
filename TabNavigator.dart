import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter_appp/chat/chatroomlist.dart';
import 'package:flutter_appp/chat/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Profile/ProfilePage.dart';
import 'package:flutter_appp/Search/search_username.dart';
import 'package:flutter_appp/feed_screen.dart';
import 'package:flutter_appp/login_screen.dart';
import 'package:flutter_appp/notifications/NotificationRepository.dart';
import 'package:flutter_appp/notifications/notification_screen.dart';
import 'package:flutter_appp/notifications/notifications_bloc.dart';
import 'package:flutter_appp/settings/settingsScreen.dart';
import '../Classes.dart';
import 'BottomNavbarItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    final routeBuilders = _routeBuilders(analytics,observer);
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

  Map<String, WidgetBuilder> _routeBuilders(FirebaseAnalytics analytics, FirebaseAnalyticsObserver observer ) {
    return {tabNavigatorRoot: (context) => _getScreen(context, item,analytics,observer)};
  }

  Widget _getScreen(BuildContext context, BottomNavbarItem item,FirebaseAnalytics analytics, FirebaseAnalyticsObserver observer) {
    Future<void> _setCurrentScreen(String page) async{
      await analytics.setCurrentScreen(screenName: page);
      print("setcurrentscreen suceeded");
    }
    switch (item) {
      case BottomNavbarItem.Main:
        _setCurrentScreen("Home Page");
        return FeedScreen(analytics: analytics, observer: observer,);
      case BottomNavbarItem.Create:
        return Scaffold();
      case BottomNavbarItem.Profile:
        _setCurrentScreen("Profile Page");
        return ViewProfileScreen(user: users[0],analytics: analytics,observer: observer,);
      case BottomNavbarItem.Search:
        _setCurrentScreen("Search Page");
        return Search(analytics: analytics,observer: observer,);
      case BottomNavbarItem.Settings:
        _setCurrentScreen("DM page");
        return settingsScreen(analytics: analytics,observer: observer,);
      case BottomNavbarItem.Chat:
        _setCurrentScreen("Chat page");
        return ChatsPage();
      case BottomNavbarItem.Notifications:
        _setCurrentScreen("Notification Page");
        return BlocProvider(
  create: (context) => NotificationsBloc(notificationRepository: context.read<NotificationRepository>()),
  child: NotificationScreen(analytics: analytics,observer: observer,),
);
      default:
        return Scaffold();
    }
  }
}