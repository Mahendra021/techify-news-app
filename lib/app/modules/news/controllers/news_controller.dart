import 'package:get/get.dart';
import 'package:news_app/app/data/model/articles_model.dart';

class NewsController extends GetxController {
  //TODO: Implement NewsController

  Rx<ArticlesModel>? articleNews;

  @override
  void onInit() {
    articleNews = ArticlesModel.fromJson(Get.arguments).obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
