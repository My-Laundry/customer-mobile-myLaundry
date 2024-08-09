import 'package:customer_laundry_app/core/widgets/selectable_service_item.dart';
import 'package:customer_laundry_app/features/order/presentation/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/styles/colors.dart';

// class SelectableServiceGrid extends StatefulWidget {
//   const SelectableServiceGrid({super.key});

//   @override
//   _SelectableServiceGridState createState() => _SelectableServiceGridState();
// }

// class _SelectableServiceGridState extends State<SelectableServiceGrid> {
//   int? selectedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       primary: false,
//       shrinkWrap: true,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       crossAxisCount: 3,
//       children: [
//         SelectableServiceItem(
//           iconPath: 'assets/icons/ic_cuciLipat.svg',
//           label: 'Cuci Lipat',
//           color: AppColors.secondaryColors[2],
//           isSelected: selectedIndex == 0,
//           onTap: () {
//             setState(() {
//               selectedIndex = 0;
//             });
//           },
//         ),
//         SelectableServiceItem(
//           iconPath: 'assets/icons/ic_cuciSatuan.svg',
//           label: 'Cuci Satuan',
//           color: Colors.green,
//           isSelected: selectedIndex == 1,
//           onTap: () {
//             setState(() {
//               selectedIndex = 1;
//             });
//           },
//         ),
//         SelectableServiceItem(
//           iconPath: 'assets/icons/ic_cuciSetrika.svg',
//           label: 'Cuci Setrika',
//           color: Colors.blue,
//           isSelected: selectedIndex == 2,
//           onTap: () {
//             setState(() {
//               selectedIndex = 2;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'selectable_service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'selectable_service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'selectable_service_item.dart';
import 'package:customer_laundry_app/features/order/presentation/bloc/order_bloc.dart';

class SelectableServiceGrid extends StatelessWidget {
  const SelectableServiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        int? selectedIndex;

        if (state is OrderServiceSelectedState) {
          selectedIndex = state.selectedIndex;
          print('Selectedd index in Grid: $selectedIndex');
        }

        List<SelectableService> services = [
          SelectableService(
            imageUrl: 'assets/icons/ic_cuciSetrika.svg',
            serviceName: 'Cuci Setrika',
            color: Colors.amber,
          ),
          SelectableService(
            imageUrl: 'assets/icons/ic_cuciSatuan.svg',
            serviceName: 'Cuci Satuan',
            color: Colors.green,
          ),
          SelectableService(
            imageUrl: 'assets/icons/ic_cuciLipat.svg',
            serviceName: 'Cuci Lipat',
            color: Colors.blue,
          ),
        ];

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // crossAxisSpacing: 16,
            // mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return SelectableServiceItem(
              iconPath: services[index].imageUrl,
              label: services[index].serviceName,
              color: services[index].color,
              isSelected:
                  BlocProvider.of<OrderBloc>(context).selectedIndex == index,
              onTap: () {
                BlocProvider.of<OrderBloc>(context)
                    .add(SelectServiceEvent(index, 1));

                // print('selected index: $selectedIndex');
              },
            );
          },
        );
      },
    );
  }
}

class SelectableService {
  final String imageUrl;
  final String serviceName;
  final Color color;

  SelectableService({
    required this.imageUrl,
    required this.serviceName,
    required this.color,
  });
}
