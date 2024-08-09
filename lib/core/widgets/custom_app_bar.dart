import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/styles/colors.dart';
import '../common/theme/font.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? action;
  final double height;
  final void Function()? onTap;
  const CustomAppBar({
    super.key,
    required this.title,
    this.action,
    this.height = 60,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        surfaceTintColor: const Color.fromRGBO(0, 0, 0, 0),
        backgroundColor: kColorScheme.surface,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: IconButton(
            onPressed: onTap ??
                () {
                  Navigator.pop(context);
                },
            icon: CircleAvatar(
              radius: 30,
              backgroundColor: kColorScheme.onSurface,
              child: Icon(
                Icons.arrow_back,
                size: 30.sp, // Adjust the icon size as needed
                // color: kColorScheme.surface,
              ),
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          title!,
          style: semiBoldText18.copyWith(
            color: kColorScheme.primary,
          ),
        ),
        actions: action,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}
