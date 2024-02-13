// ignore: implementation_imports
import 'package:dio/src/response.dart';
import 'client.dart';

class APIManager extends DioClient {
  Future<Response> topHeadlines([String? sources]) {
    Map<String, dynamic> queryParameters = {
      "apiKey": "0a7bdfe011a74df6b521cbddba406b33",
      "language": "en",
    };
    if (sources != null && sources.isNotEmpty) {
      queryParameters["sources"] = sources;
    }
    return get(
      "https://newsapi.org/v2/top-headlines",
      queryParameters: queryParameters,
    );
  }
}
