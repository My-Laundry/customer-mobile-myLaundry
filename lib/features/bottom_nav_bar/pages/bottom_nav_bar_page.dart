import 'package:customer_laundry_app/features/bottom_nav_bar/cubit/bottom_nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});
  // body: Obx(() => controller.pages[controller.currentIndex.value]),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      //   builder: (context, state) {
      //     int currentIndex = 0;
      //     if (state is BottomNavBarIndex) {
      //       currentIndex = state.currentIndex;
      //     }
      //     return IndexedStack(
      //       index: currentIndex,
      //       children: context.watch<BottomNavBarCubit>().pages,
      //     );
      //   },
      // ),
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          final cubit = context.watch<BottomNavBarCubit>();
          return cubit.getCurrentPage();
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is BottomNavBarIndex) {
            currentIndex = state.currentIndex;
          }
          return BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.lightBlue,
            unselectedItemColor: Colors.grey.withOpacity(0.8),
            onTap: (index) {
              context.read<BottomNavBarCubit>().changePage(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profil'),
            ],
          );
        },
      ),
    );
  }
}
