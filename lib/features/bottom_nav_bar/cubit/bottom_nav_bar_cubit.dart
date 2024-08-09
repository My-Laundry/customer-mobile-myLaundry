import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarIndex(0));

  final List<Widget> pages = [
    // const HomePage(),
    // const UserPage(),
    // const ProfilePage(),
  ];

  void changePage(int index) {
    emit(BottomNavBarIndex(index));
  }

  getCurrentPage() {
    if (state is BottomNavBarIndex) {
      int currentIndex = (state as BottomNavBarIndex).currentIndex;
      return pages[currentIndex];
    }
    // Default return, can be null or a default page
    return pages[0]; // Returning first page as default
  }
}
