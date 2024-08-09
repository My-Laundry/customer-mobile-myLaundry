// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../common/styles/colors.dart';
// import '../common/theme/font.dart';

// class SelectableServiceItem extends StatelessWidget {
//     final int? selectedIndex;

//   final String iconPath;
//   final String label;
//   final Color color;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const SelectableServiceItem({
//     super.key,
//     required this.iconPath,
//     required this.label,
//     required this.color,
//     required this.isSelected,
//     required this.onTap, this.selectedIndex,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(24),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: color,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.4),
//                       spreadRadius: 1,
//                       blurRadius: 2,
//                       offset: const Offset(0, 0),
//                     ),
//                   ],
//                   border: isSelected
//                       ? Border.all(color: Colors.lightBlue, width: 3)
//                       : null,
//                 ),
//                 child: SvgPicture.asset(
//                   iconPath,
//                   height: 30.sp,
//                 ),
//               ),
//               Text(
//                 label,
//                 style: mediumText10,
//               ),
//             ],
//           ),
//           if (isSelected)
//             Positioned(
//               top: 0,
//               right: 12,
//               child: CircleAvatar(
//                 backgroundColor: Colors.lightBlue,
//                 radius: 12,
//                 child: Icon(
//                   Icons.check_rounded,
//                   color: kColorScheme.surface,
//                   size: 16.sp,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/theme/font.dart';

class SelectableServiceItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableServiceItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  border: isSelected
                      ? Border.all(color: Colors.lightBlue, width: 3)
                      : null,
                ),
                child: SvgPicture.asset(
                  iconPath,
                  height: 30.sp,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: mediumText10,
              ),
            ],
          ),
          if (isSelected)
            Positioned(
              top: 0,
              right: 12,
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius: 12,
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
