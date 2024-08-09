import 'package:customer_laundry_app/features/main/presentation/bloc/main_bloc.dart';
import 'package:customer_laundry_app/features/order/presentation/pages/order_page.dart';
import 'package:customer_laundry_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/salomon_bottom.dart';
import '../../../home/presentation/pages/home_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Widget> pages = [
    const HomePage(),
    Container(), // Placeholder for the second page
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          final bloc = context.read<MainBloc>();

          return Scaffold(
            body: pages.elementAt(
              (state as MainInitial).currentIndex,
            ),
            bottomNavigationBar: SalomonBottom(
              currentIndex: state.currentIndex,
              onTap: (index) {
                if (index == 1) {
                  _showModalBottomSheet(context);
                } else {
                  bloc.add(PageChangedEvent(index));
                }
              },
            ),
          );
        },
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // enableDrag: true,
      // isDismissible: true,

      builder: (BuildContext context) {
        return const OrderPage();
      },
    );
  }
}


// import 'package:customer_laundry_app/features/main/presentation/bloc/main_bloc.dart';
// import 'package:customer_laundry_app/features/profile/presentation/pages/profile_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/widgets/salomon_bottom.dart';
// import '../../../home/presentation/pages/home_page.dart';

// class MainPage extends StatelessWidget {
//   MainPage({super.key});

//   final List<Widget> pages = [
//     const HomePage(),
//     const HomePage(),
//     const ProfilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => MainBloc(),
//       child: BlocBuilder<MainBloc, MainState>(
//         builder: (context, state) {
//           final bloc = context.read<MainBloc>();

//           return Scaffold(
//             body: pages.elementAt(
//               (state as MainInitial).currentIndex,
//             ),
//             bottomNavigationBar: SalomonBottom(
//               currentIndex: (state).currentIndex,
//               onTap: (index) => bloc.add(PageChangedEvent(index)),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
