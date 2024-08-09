part of 'bottom_nav_bar_cubit.dart';

abstract class BottomNavBarState extends Equatable {
  const BottomNavBarState();

  @override
  List<Object> get props => [];
}

class BottomNavBarInitial extends BottomNavBarState {}

class BottomNavBarIndex extends BottomNavBarState {
  final int currentIndex;
  const BottomNavBarIndex(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
