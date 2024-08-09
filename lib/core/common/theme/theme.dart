import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/colors.dart';

ThemeData themeData = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.blue,
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.transparent,
    backgroundColor: kColorScheme.surface,
  ),
  cardTheme: const CardTheme(
    surfaceTintColor: Colors.white,
  ),
);
