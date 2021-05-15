import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'BottomNavbar.dart';
import 'BottomNavbarItem.dart';
import 'TabNavigator.dart';
import 'bottom_nav_bar_cubit.dart';
class NavigationScreen extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  final Map<BottomNavbarItem,IconData> items = const {
    BottomNavbarItem.Main: Icons.home,
    BottomNavbarItem.Create: Icons.add,
    BottomNavbarItem.Profile: Icons.person,
    BottomNavbarItem.Search: Icons.search,
    BottomNavbarItem.DM: Icons.mail,
    BottomNavbarItem.Notifications: Icons.notifications,
  };


  final Map<BottomNavbarItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavbarItem.Main: GlobalKey<NavigatorState>(),
    BottomNavbarItem.Create: GlobalKey<NavigatorState>(),
    BottomNavbarItem.Profile: GlobalKey<NavigatorState>(),
    BottomNavbarItem.Search: GlobalKey<NavigatorState>(),
    BottomNavbarItem.DM: GlobalKey<NavigatorState>(),
    BottomNavbarItem.Notifications: GlobalKey<NavigatorState>(),
  };

  NavigationScreen({Key key, this.analytics, this.observer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        if(navigatorKeys[context
            .read<BottomNavBarCubit>()
            .state
            .selectedItem]
            .currentState
            .canPop()) {
          navigatorKeys[context
              .read<BottomNavBarCubit>()
              .state
              .selectedItem].currentState.pop();
        }
        else {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      },
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: items
                  .map((item, _) => MapEntry(
                item,
                _buildOffstageNavigator(
                  item,
                  item == state.selectedItem,
                ),
              ))
                  .values
                  .toList(),
            ),
            bottomNavigationBar: BottomNavBar(
              items: items,
              selected: state.selectedItem,
              onTap: (index) {
                final selectedItem = BottomNavbarItem.values[index];
                _selectBottomNavItem(
                  context,
                  selectedItem,
                  selectedItem == state.selectedItem,
                );
              },
            ),
          );
        },
      ),
    );
  }
  void _selectBottomNavItem(
      BuildContext context,
      BottomNavbarItem selectedItem,
      bool isSameItem,
      ) {
    if (isSameItem) {
      navigatorKeys[selectedItem]
          .currentState
          .popUntil((route) => route.isFirst);
    }
    context.read<BottomNavBarCubit>().updateSelectedItem(selectedItem);
  }

  Widget _buildOffstageNavigator(
      BottomNavbarItem currentItem,
      bool isSelected,
      ) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem],
        item: currentItem,
      ),
    );
  }

}