part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class SelectServiceEvent extends OrderEvent {
  final int index;
  final int viewIndex;

  const SelectServiceEvent(this.index, this.viewIndex);

  @override
  List<Object> get props => [index, viewIndex];
}

class SwitchViewEvent extends OrderEvent {
  final int viewIndex;

  const SwitchViewEvent(this.viewIndex);

  @override
  List<Object> get props => [viewIndex];
}


class AddSelectedItem extends OrderEvent {
  final LaundrySatuan item;

  const AddSelectedItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveSelectedItem extends OrderEvent {
  final LaundrySatuan item;

  const RemoveSelectedItem(this.item);

  @override
  List<Object> get props => [item];
}

class UpdateSelectedListEvent extends OrderEvent {
  final List<LaundrySatuan> selectedItems;

  const UpdateSelectedListEvent(this.selectedItems);

  @override
  List<Object> get props => [selectedItems];
}