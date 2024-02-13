import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:news_app/app/modules/home/views/bookmark_page.dart';
import 'package:news_app/app/modules/home/views/home_page.dart';
import 'package:news_app/app/modules/home/views/search_page.dart';
import 'package:news_app/app/modules/home/views/setting_page.dart';
import 'package:news_app/widget/custom_text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor:
              controller.currentPage.value == 3 ? context.theme.colorScheme.background : null,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const CustomText("News"),
          ),
          centerTitle: false,
        ),
        body: PageView(
          controller: controller.pageController,
          children: const [
            HomePage(),
            SearchPage(),
            BookmarkPage(),
            SettingPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            controller.pageController.jumpToPage(value);
            controller.currentPage.value = value;
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentPage.value,
          selectedItemColor: const Color(0xFFEA8C40),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "",
            )
          ],
        ),
      ),
    );
  }
}
