part of 'bottom_nav_bar_cubit.dart';

@immutable
class BottomNavBarState extends Equatable{
  final BottomNavbarItem selectedItem;
  const BottomNavBarState({@required this.selectedItem});

  @override
  List<Object> get props => [selectedItem];
}