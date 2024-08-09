part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {
  final int currentIndex;

  const MainInitial({this.currentIndex = 0});

  @override
  List<Object> get props => [currentIndex];
}
