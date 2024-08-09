import 'package:customer_laundry_app/core/common/styles/colors.dart';
import 'package:customer_laundry_app/core/common/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalomonBottom extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  const SalomonBottom({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      currentIndex: currentIndex,
      selectedItemColor: kColorScheme.primary,
      selectedColorOpacity: 1.0,
      unselectedItemColor: kColorScheme.primary,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      onTap: onTap,
      items: [
        SalomonBottomBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_home.svg',
            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? kColorScheme.surface : kColorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            'Beranda',
            style: boldText14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        SalomonBottomBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_laundry.svg',
            colorFilter: ColorFilter.mode(
              currentIndex == 1 ? kColorScheme.surface : kColorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            'Laundry',
            style: boldText14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        SalomonBottomBarItem(
          unselectedColor: kColorScheme.surface,
          icon: SvgPicture.asset(
            'assets/icons/ic_profile.svg',
            colorFilter: ColorFilter.mode(
              currentIndex == 2 ? kColorScheme.surface : kColorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            'Profil',
            style: boldText14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
