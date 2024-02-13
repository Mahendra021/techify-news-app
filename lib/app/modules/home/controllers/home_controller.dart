import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/model/articles_model.dart';
import 'package:news_app/app/data/dio/api_service.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  Rx<TabController>? tabController;
  PageController pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;

  RxList newsList = [].obs;
  RxBool darkMode = false.obs;
  RxBool notification = false.obs;

  List<Map<String, String>> tabList = [
    {"title": "All News", "value": ""},
    {"title": "ABC News", "value": "abc-news"},
    {"title": "Ars Technica", "value": "ars-technica"},
    {"title": "Bleacher Report", "value": "bleacher-report"},
    {"title": "The Hindu", "value": "the-hindu"},
    {"title": "The Times of India", "value": "the-times-of-india"},
  ];

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: tabList.length).obs;
    darkMode.value = Get.isDarkMode ? true : false;
    getNewsList();
    super.onInit();
  }

  getNewsList([String? source]) {
    APIManager().topHeadlines(source).then((response) {
      newsList.value = articlesModelFromJson(jsonEncode(response.data["articles"]));
      newsList.refresh();
    });
  }
}
