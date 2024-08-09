part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}
class PageChangedEvent extends MainEvent {
  final int index;

  const PageChangedEvent(this.index);

  @override
  List<Object> get props => [index];
}