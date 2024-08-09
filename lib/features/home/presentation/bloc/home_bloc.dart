import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int current = 0;

  HomeBloc() : super(HomeInitial()) {
    on<PageChangedEvent>((event, emit) {
      current = event.index;
      emit(PageChanged(current));
    });

    on<LoadCategoriesEvent>(
      (event, emit) {
        emit(CategoriesLoaded(services: services));
      },
    );
  }

  final List<String> listImage = [
    'assets/images/img_dummyDiscount1.png',
    'assets/images/img_dummyDiscount1.png',
    'assets/images/img_dummyDiscount1.png',
    // 'https://picsum.photos/seed/picsum/400/300'
    //     'https://picsum.photos/seed/picsum/400/300'
    //     'https://picsum.photos/seed/picsum/400/300'
  ];

  final Map<String, Map<String, dynamic>> services = {
    'Jemput-Antar': {
      'icon': 'assets/icons/ic_jemputAntar.svg',
      'color': Colors.red,
    },
    'Cuci Lipat': {
      'icon': 'assets/icons/ic_cuciLipat.svg',
      'color': Colors.amber,
    },
    'Cuci Satuan': {
      'icon': 'assets/icons/ic_cuciSatuan.svg',
      'color': Colors.green,
    },
    'Cuci Setrika': {
      'icon': 'assets/icons/ic_cuciSetrika.svg',
      'color': Colors.blue,
    },
  };

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    add(PageChangedEvent(index));
  }
}
