import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/app/routes/app_pages.dart';
import 'package:news_app/utils/image_constant.dart';
import 'package:news_app/widget/custom_text.dart';

import 'package:timeago/timeago.dart' as timeago;

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: controller.tabController!.value,
          isScrollable: true,
          labelColor: Colors.black,
          indicatorColor: const Color(0xFFEA8C40),
          labelStyle: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w500),
          onTap: (i) => controller.getNewsList(controller.tabList[i]["value"]),
          tabs: [...controller.tabList.map((tab) => Tab(text: tab["title"])).toList()],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
            ),
            items: controller.newsList
                .sublist(0, controller.newsList.length > 5 ? 5 : controller.newsList.length)
                .map((i) {
              return InkWell(
                onTap: () => Get.toNamed(Routes.NEWS, arguments: i.toJson()),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: i.urlToImage ?? "",
                          height: 200,
                          width: MediaQuery.of(context).size.width,
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
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                timeago.format(i.publishedAt),
                                color: Colors.white,
                              ),
                              const Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Container(
                          width: 0.75.sw,
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            i.title,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  "Latest News",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.newsList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () =>
                          Get.toNamed(Routes.NEWS, arguments: controller.newsList[index].toJson()),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Container(
                                transform: Matrix4.translationValues(-10, -10, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: controller.newsList[index].urlToImage ?? "",
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
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        controller.newsList[index].title,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            timeago.format(
                                              controller.newsList[index].publishedAt,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.bookmark_border,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
