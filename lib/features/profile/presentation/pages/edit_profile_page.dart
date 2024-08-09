import 'dart:ui';

import 'package:customer_laundry_app/core/common/theme/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/common/styles/colors.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorScheme.surface,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Image.network(
                  'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 2.3,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 148, 148, 148),
                        highlightColor: const Color.fromARGB(255, 102, 95, 95),
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
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: MediaQuery.of(context).padding.top,
                    ),
                    child: CircleAvatar(
                      radius: 22.sp,
                      backgroundColor: kColorScheme.surface,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 24.sp,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                          fit: BoxFit.cover,
                          width: 120.h,
                          height: 120.h,
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
                                  width: 120.h,
                                  height: 120.h,
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
                              height: 120.h,
                              width: 120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Colors.grey,
                              ),
                              child: const Icon(
                                Icons.image_not_supported,
                                size: 60,
                                color: Color.fromARGB(255, 53, 53, 53),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: CircleAvatar(
                          backgroundColor: kColorScheme.primary,
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: kColorScheme.surface,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextField(
                      labelText: 'Nama',
                      color: kColorScheme.surface,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildTextField(
              labelText: 'Email',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildTextField(
              labelText: 'Nomor Telepon',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(
                Size(
                  MediaQuery.sizeOf(context).width / 2.3,
                  40.h,
                ),
              ),
              backgroundColor: WidgetStatePropertyAll(
                kColorScheme.error,
              ),
              shape: const WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Hapus Akun',
              style: mediumText14.copyWith(
                color: kColorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTextField({
    required String labelText,
    required Color color,
  }) {
    return TextField(
      maxLines: 1,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: mediumText12.copyWith(
          color: color,
          decorationColor: color,
        ),
        fillColor: color,
        suffixIcon: Icon(
          Icons.edit,
          color: color,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
        ),
      ),
      cursorColor: color,
    );
  }
}
