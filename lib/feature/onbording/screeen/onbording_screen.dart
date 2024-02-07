import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:walletapp/constant/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [
          Padding(
            padding: REdgeInsets.only(left: 42.sp),
            child: SvgPicture.asset(AppImages.onBording),
          ),
          Expanded(child: SizedBox(height: 40.h)),
          Text(
            'Manage your',
            style: theme.textTheme.titleLarge,
          ),
          Text(
            'finances',
            style: theme.textTheme.titleLarge,
          ),
          Text(
            'simply',
            style: theme.textTheme.titleLarge,
          ),
          Expanded(child: SizedBox(height: 40.h)),
          Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: theme.colorScheme.primaryContainer,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 34,
                ),
                onPressed: () {
                  context.push('/auth');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
