import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:news_app/utils/image_constant.dart';
import 'package:news_app/widget/custom_text.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: controller.articleNews!.value.urlToImage ?? "",
                  height: 300,
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
                top: MediaQuery.of(context).padding.top,
                left: 20,
                child: SizedBox(
                  width: 1.sw - 40,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.chevron_left,
                          color: context.theme.colorScheme.background,
                        ),
                      ),
                      const Spacer(),
                      Transform.flip(
                        flipX: true,
                        child: Icon(
                          Icons.reply,
                          color: context.theme.colorScheme.background,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.bookmark,
                        color: context.theme.colorScheme.background,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: context.theme.colorScheme.primary,
                        width: 3,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(
                    controller.articleNews!.value.title,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CustomText(controller.articleNews!.value.content!)
              ],
            ),
          )
        ],
      ),
    );
  }
}
