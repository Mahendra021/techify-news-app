import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/themes/dark_theme.dart';
import 'package:news_app/utils/image_constant.dart';
import 'package:news_app/widget/custom_switch.dart';
import 'package:news_app/widget/custom_text.dart';

import '../../../../themes/light_theme.dart';

class SettingPage extends GetView<HomeController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: context.theme.colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: "",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 50,
                            maxWidth: 50,
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.grey.shade200,
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          ImageConstant.newsError,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          "Michael Faradey",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        const CustomText(
                          "michaelfaeadey@yopmail.com",
                        ),
                        CustomText(
                          "Sign out",
                          fontSize: 16,
                          color: context.theme.colorScheme.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        "Dark Mode",
                        fontWeight: FontWeight.bold,
                      ),
                      CustomSwitch(
                        height: 25.h,
                        width: 50.w,
                        padding: 6.sp,
                        toggleSize: 14.sp,
                        showOnOff: false,
                        value: controller.darkMode.value,
                        inactiveColor: const Color(0xFFFF5252),
                        activeColor: const Color(0xFF5ED178),
                        activeIcon: Icon(
                          Icons.check,
                          size: 14.sp,
                          color: context.theme.colorScheme.background,
                        ),
                        inactiveIcon: Icon(
                          Icons.close,
                          size: 14.sp,
                          color: context.theme.colorScheme.background,
                        ),
                        onChanged: (value) {
                          controller.darkMode.toggle();
                          Get.changeTheme(Get.isDarkMode ? lightTheme : darkTheme);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        "Notification",
                        fontWeight: FontWeight.bold,
                      ),
                      CustomSwitch(
                        height: 25.h,
                        width: 50.w,
                        padding: 6.sp,
                        toggleSize: 14.sp,
                        showOnOff: false,
                        value: controller.notification.value,
                        inactiveColor: const Color(0xFFFF5252),
                        activeColor: const Color(0xFF5ED178),
                        activeIcon: Icon(
                          Icons.check,
                          size: 14.sp,
                          color: context.theme.colorScheme.background,
                        ),
                        inactiveIcon: Icon(
                          Icons.close,
                          size: 14.sp,
                          color: context.theme.colorScheme.background,
                        ),
                        onChanged: (value) {
                          controller.notification.toggle();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomText(
                "Account",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        "Edit Account",
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.chevron_right,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        "Change Password",
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.chevron_right,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        "language",
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.chevron_right,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomText(
                "Privacy and Security",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        "Private Account",
                        fontWeight: FontWeight.bold,
                      ),
                      CustomSwitch(
                        height: 25.h,
                        width: 50.w,
                        padding: 6.sp,
                        toggleSize: 14.sp,
                        showOnOff: false,
                        value: controller.darkMode.value,
                        inactiveColor: const Color(0xFFFF5252),
                        activeColor: const Color(0xFF5ED178),
                        activeIcon: Icon(
                          Icons.check,
                          size: 14.sp,
                          color: context.theme.colorScheme.background,
                        ),
                        inactiveIcon: Icon(
                          Icons.close,
                          size: 14.sp,
                          color: context.theme.colorScheme.background,
                        ),
                        onChanged: (value) {
                          controller.darkMode.toggle();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        "Privacy and Security Help",
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.chevron_right,
                        ),
                      )
                    ],
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
