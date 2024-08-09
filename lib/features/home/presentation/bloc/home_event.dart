part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class PageChangedEvent extends HomeEvent {
  final int index;

  const PageChangedEvent(this.index);

  @override
  List<Object> get props => [index];
}

class LoadCategoriesEvent extends HomeEvent {}
