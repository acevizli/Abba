import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appp/navigations/BottomNavbarItem.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState(selectedItem: BottomNavbarItem.Main));

  void updateSelectedItem(BottomNavbarItem item)
  {
    if(item != state.selectedItem)
      {
        emit(BottomNavBarState(selectedItem: item));
      }
  }
}
