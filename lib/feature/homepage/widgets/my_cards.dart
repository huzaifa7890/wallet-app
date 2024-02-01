import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyCards extends StatelessWidget {
  final String imagePath;
  final double rs;
  final String cardName;

  const MyCards(
      {super.key,
      required this.imagePath,
      required this.rs,
      required this.cardName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 8.h),
      child: Container(
        height: 64.h,
        decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(imagePath),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, top: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$ ${rs.toString()} ",
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.black),
                            ),
                            Text(
                              cardName,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 14.sp,
                                color: theme.colorScheme.tertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
