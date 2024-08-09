part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderServiceSelectedState extends OrderState {
  final int selectedIndex;

  const OrderServiceSelectedState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class OrderViewState extends OrderState {
  final int currentView;

  const OrderViewState(this.currentView);

  @override
  List<Object> get props => [currentView];
}

class OrderUpdated extends OrderState {
  final List<LaundrySatuan> selectedItems;

  const OrderUpdated(this.selectedItems);

  @override
  List<Object> get props => [selectedItems];
}