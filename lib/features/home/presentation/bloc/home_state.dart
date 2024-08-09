part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class PageChanged extends HomeState {
  final int current;

  const PageChanged(this.current);

  @override
  List<Object> get props => [current];
}

class CategoriesLoaded extends HomeState {
  final Map<String, Map<String, dynamic>> services;

  const CategoriesLoaded({required this.services});

  @override
  List<Object> get props => [services];
}
