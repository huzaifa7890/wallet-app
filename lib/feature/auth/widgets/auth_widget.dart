import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:walletapp/constant/app_color.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: REdgeInsets.only(top: 55.h, left: 6.w),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: AppColor.primary,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            // top: 6.h,
            left: 20.w,
          ),
          child: Text(
            "Sign in",
            style: theme.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 14.h, left: 20.w),
          child: Text(
            "Email",
            style: theme.textTheme.titleSmall,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Email',
              fillColor: Colors.black,
              hintStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.tertiary,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0.h),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 18.h, left: 20.w),
          child: Text(
            "Password",
            style: theme.textTheme.titleSmall,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter Password',
              contentPadding: EdgeInsets.symmetric(vertical: 0.h),
              hintStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.tertiary,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.h, left: 20.w, right: 20.w),
          child: Container(
              width: 335.w,
              height: 54.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD4D8D7),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    context.push('/homepage');
                  },
                  child: Text(
                    "Sign In",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              )),
        ),
        Padding(
          padding: REdgeInsets.only(top: 18.h, left: 20.w),
          child: Center(
            child: Text(
              "Forgot your password?",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don`t have an account? ",
                      style: theme.textTheme.bodySmall,
                    ),
                    Text(
                      "SignUp",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
