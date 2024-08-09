import 'package:customer_laundry_app/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/common/styles/colors.dart';
import '../../../../core/common/theme/font.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorScheme.surface,
      body: Column(
        children: [
          _buildHeader(
            context: context,
          ),
          const SizedBox(height: 120),
          GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              // vertical: 40,
            ),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                    child: SvgPicture.asset(
                      'assets/icons/ic_security.svg',
                      height: 30.sp,
                    ),
                  ),
                  // const SizedBox(height: 2),
                  Text(
                    'Keamanan',
                    style: mediumText10,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                    child: SvgPicture.asset(
                      'assets/icons/ic_language.svg',
                      height: 28.sp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Bahasa',
                    style: mediumText10,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                    child: SvgPicture.asset(
                      'assets/icons/ic_notification.svg',
                      height: 28.sp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Notifikasi',
                    style: mediumText10,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                    child: SvgPicture.asset(
                      'assets/icons/ic_policy.svg',
                      height: 24.sp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ketentuan',
                    style: mediumText10,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                    child: SvgPicture.asset(
                      'assets/icons/ic_logout.svg',
                      height: 28.sp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Keluar',
                    style: mediumText10,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildHeader({
    required BuildContext context,
  }) {
    return Container(
      width: double.infinity,
      height: 220.h,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: kColorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(43),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0,
            bottom: -30,
            child: SvgPicture.asset(
              'assets/images/img_shortPant.svg',
            ),
          ),
          Positioned(
            right: -20,
            top: -30,
            child: SvgPicture.asset(
              'assets/images/img_tshirt.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Profil',
              style: mediumText16.copyWith(
                color: kColorScheme.surface,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 220.h,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kColorScheme.surfaceContainer,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                          fit: BoxFit.cover,
                          width: 90.h,
                          height: 90.h,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Shimmer.fromColors(
                                baseColor:
                                    const Color.fromARGB(255, 148, 148, 148),
                                highlightColor:
                                    const Color.fromARGB(255, 102, 95, 95),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Colors.grey,
                              ),
                              child: const Icon(
                                Icons.image_not_supported,
                                size: 40,
                                color: Color.fromARGB(255, 53, 53, 53),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nida Askandar Nida Askandar Nida Askandar',
                              style: mediumText20,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              softWrap: false,
                            ),
                            Text(
                              'niduaskandar@gmail.com',
                              style: regularText12.copyWith(
                                decoration: TextDecoration.underline,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              softWrap: false,
                            ),
                            Text(
                              '+628123456789 ',
                              style: regularText12.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const EditProfilePage();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kColorScheme.primary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 20,
                                ),
                                child: Text(
                                  'Ubah Profil',
                                  style: mediumText12.copyWith(
                                    color: kColorScheme.surface,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              minimumSize: const WidgetStatePropertyAll(
                                Size(double.infinity, double.infinity),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                kColorScheme.onSurface,
                              ),
                              shape: const WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            label: Text(
                              'Promo',
                              style: semiBoldText14.copyWith(
                                color: kColorScheme.primary,
                              ),
                            ),
                            icon: SvgPicture.asset(
                              'assets/icons/ic_promo.svg',
                              height: 16.sp,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              minimumSize: const WidgetStatePropertyAll(
                                Size(double.infinity, double.infinity),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                kColorScheme.onSurface,
                              ),
                              shape: const WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            label: Text(
                              'Riwayat',
                              style: semiBoldText14.copyWith(
                                color: kColorScheme.primary,
                              ),
                            ),
                            icon: SvgPicture.asset(
                              'assets/icons/ic_history.svg',
                              height: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
