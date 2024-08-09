import 'package:customer_laundry_app/core/common/styles/colors.dart';
import 'package:customer_laundry_app/core/widgets/selectable_service_grid.dart';
import 'package:customer_laundry_app/features/order/data/models/service_laundry.dart';
import 'package:customer_laundry_app/features/order/presentation/bloc/order_bloc.dart';
import 'package:customer_laundry_app/features/order/presentation/pages/loading_finding_courier.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../../core/common/theme/font.dart';
import '../../../../core/widgets/selectable_service_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc(),
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is OrderServiceSelectedState) {
            print('selected index: ${state.selectedIndex}');
          }
        },
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            int currentView = state is OrderViewState ? state.currentView : 0;
            int? selectedIndex =
                state is OrderServiceSelectedState ? state.selectedIndex : null;

            return currentView == 0
                ? _orderPage1(context)
                : _orderPage2(context, selectedIndex);
          },
        ),
      ),
    );
  }

  Widget _orderPage1(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width / 3,
                height: 6.h,
                decoration: BoxDecoration(
                  color: AppColors.neutralColors[1],
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: TextEditingController(),
                cursorColor: Colors.blue,
                style: regularText14,
                decoration: InputDecoration(
                  fillColor: kColorScheme.onSecondary,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  hintText: 'Temukan lokasimu saat ini...',
                  hintStyle: mediumText12.copyWith(color: Colors.grey),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.black, size: 24.sp),
                  suffixIcon: Icon(
                    Icons.location_pin,
                    color: const Color(0xFFCC4851),
                    size: 24.sp,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Item 1'),
                onTap: () {
                  BlocProvider.of<OrderBloc>(context)
                      .add(const SwitchViewEvent(1));
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderPage2(BuildContext context, int? selectedIndex) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width / 3,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.neutralColors[1],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                BlocProvider.of<OrderBloc>(context)
                    .add(const SwitchViewEvent(0));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kColorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: const Color(0xFFCC4851),
                            size: 24.sp,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pondok Madani',
                                  style: mediumText12,
                                ),
                                Text(
                                  'Jl. Telekomunikasi No.1, Terusan Buahbatu - Bojongsoang...',
                                  style: regularText12,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kColorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: kColorScheme.primary,
                              size: 24.sp,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '+62813981374',
                              style: mediumText12,
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kColorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: kColorScheme.primary,
                        size: 24.sp,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Promo',
                        style: mediumText12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SelectableServiceGrid(),
            const SizedBox(height: 12),
            Visibility(
              visible: BlocProvider.of<OrderBloc>(context).selectedIndex == 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors
                          .white, // Or any other background color you need
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    height: 180.w,
                    margin: const EdgeInsets.only(
                      bottom: 24,
                      top: 12,
                    ),
                    child: Expanded(
                      child: FilterListWidget<LaundrySatuan>(
                        hideSearchField: true,
                        hideHeader: true,
                        listData: dummyLaundrySataun,
                        selectedListData: const [],
                        themeData: FilterListThemeData(
                          // controlButtonBarTheme: ControlButtonBarThemeData(
                          //   context,
                          //   decoration: BoxDecoration(
                          //     color: const Color.fromARGB(255, 231, 231, 241),
                          //     borderRadius: BorderRadius.circular(50),
                          //   ),
                          //   controlButtonTheme: const ControlButtonThemeData(
                          //       // borderRadius: 50,
                          //       // backgroundColor: kColorScheme.primary,
                          //       // c\
                          //       ),
                          // ),
                          context,
                          choiceChipTheme: ChoiceChipThemeData(
                            selectedBackgroundColor: kColorScheme
                                .primary, // Background color when selected
                            selectedTextStyle: const TextStyle(
                              color: Colors.white,
                            ), // Text color when selected
                          ),
                        ),
                        onApplyButtonClick: (list) {
                          // Do something with the selected list
                        },
                        choiceChipLabel: (item) {
                          return item!.name; // Display text on chip
                        },
                        choiceChipBuilder: (context, item, isSelected) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: (isSelected ?? false)
                                  ? kColorScheme.primary
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item.name,
                              style: mediumText12.copyWith(
                                color: (isSelected ?? false)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          );
                        },
                        // controlButtons: const [],
                        resetButtonText: 'Hapus Semua',
                        allButtonText: 'Semua',
                        applyButtonText: 'Pilih',

                        validateSelectedItem: (list, val) {
                          return list!
                              .contains(val); // Identify if item is selected
                        },
                        onItemSearch: (user, query) {
                          return user.name.toLowerCase().contains(
                              query.toLowerCase()); // Search functionality
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SlideAction(
              elevation: 0,
              innerColor: kColorScheme.primary,
              outerColor: const Color(0xFFB0B2E7),
              sliderButtonIcon: Shimmer.fromColors(
                baseColor: const Color(0xFFB0B2E7),
                highlightColor: kColorScheme.primary,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kColorScheme.surface,
                ),
              ),
              text: '', // Remove the static text here
              textStyle: mediumText14.copyWith(
                color: kColorScheme.surface,
              ),
              onSubmit: () {
                return Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoadingFindingCourier();
                        },
                      ),
                    );
                  },
                );
              },
              child: Shimmer.fromColors(
                baseColor: kColorScheme.surface,
                highlightColor: kColorScheme.primary,
                child: Text(
                  'Geser Untuk Pemesanan',
                  style: mediumText14.copyWith(
                    color: kColorScheme.surface,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
