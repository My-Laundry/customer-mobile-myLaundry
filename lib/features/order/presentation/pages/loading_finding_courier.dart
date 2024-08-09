import 'package:customer_laundry_app/core/common/styles/colors.dart';
import 'package:customer_laundry_app/core/common/theme/font.dart';
import 'package:customer_laundry_app/core/widgets/custom_app_bar.dart';
import 'package:customer_laundry_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingFindingCourier extends StatelessWidget {
  const LoadingFindingCourier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorScheme.surface,
      appBar: const CustomAppBar(title: ''),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset('assets/icons/ic_findCourier.svg'),
                ),
                Text(
                  'Sedang Mencari Kurir',
                  style: semiBoldText20,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: LoadingAnimationWidget.inkDrop(
                color: kColorScheme.primary,
                size: 80.sp,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kColorScheme.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              'Batalkan',
              style: mediumText14.copyWith(
                color: kColorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
