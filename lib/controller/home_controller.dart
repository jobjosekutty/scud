// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/news_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  List<Article>? article = [];
  bool loading = false;

  fetchData() async {
    loading = true;
    final http.Response response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&apiKey=4f48f6a5f3f442d2bef019160931f438'),
    );
    print('///////////sc${response.statusCode}');
    print(response.body);
    var data = newsFromJson(response.body);
    article = data.articles;
    loading = false;
    update();
  }
}
