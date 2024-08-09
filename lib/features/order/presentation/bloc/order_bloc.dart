import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/service_laundry.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  int selectedIndex = 0;
  List<LaundrySatuan> selectedItems = [];

  OrderBloc() : super(OrderInitial()) {
    on<SelectServiceEvent>((event, emit) {
      selectedIndex = event.index;
      emit(OrderServiceSelectedState(selectedIndex));
      emit(OrderViewState(event.viewIndex));
    });
    on<AddSelectedItem>(_onAddSelectedItem);
    on<RemoveSelectedItem>(_onRemoveSelectedItem);
    on<UpdateSelectedListEvent>(_onUpdateSelectedList);

    on<SwitchViewEvent>((event, emit) {
      emit(OrderViewState(event.viewIndex));
    });
  }
  void _onAddSelectedItem(AddSelectedItem event, Emitter<OrderState> emit) {
    selectedItems.add(event.item);
    emit(OrderUpdated(List.from(selectedItems)));
  }

  void _onRemoveSelectedItem(
      RemoveSelectedItem event, Emitter<OrderState> emit) {
    selectedItems.remove(event.item);
    emit(OrderUpdated(List.from(selectedItems)));
  }

  void _onUpdateSelectedList(
      UpdateSelectedListEvent event, Emitter<OrderState> emit) {
    selectedItems = event.selectedItems;
    emit(OrderUpdated(List.from(selectedItems)));
  }
}
