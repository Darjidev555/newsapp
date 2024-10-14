import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/NewsModel.dart';

class Newscontroller extends GetxController {
  RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxBool istrandingLoading = false.obs;
  RxBool isnewsForyouLoading = false.obs;

  @override
  void onInit() {
    getTrandingNews();
    getnewsForYou();
    super.onInit();
  }

  Future<void> getTrandingNews() async {
    istrandingLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=feac6772bf7143e1976d85e79fb8633a";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var article = body['articles'];
        for (var news in article) {
          trandingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print("Somthing Went Wrong");
      }
    } catch (e) {
      print(e);
    }
    istrandingLoading.value = false;
  }

  Future<void> getnewsForYou() async {
    isnewsForyouLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=feac6772bf7143e1976d85e79fb8633a";

    try {
      var response = await http.get(
        Uri.parse(baseUrl),
      );

      // Debug print to check response status
      print("Response status: ${response.statusCode}");

      // Check if request is successful
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];
        for (var news in articles) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
      } else if (response.statusCode == 403) {
        print("Access Denied: Check your API key or permissions.");
      } else {
        print("Something went wrong, Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
    isnewsForyouLoading.value = false;
  }

  Future<void> searchNews(String search,
      {String country = "us", String category = "business"}) async {
    isnewsForyouLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&q=$search&apiKey=feac6772bf7143e1976d85e79fb8633a";

    try {
      var response = await http.get(Uri.parse(baseUrl));

      // Debug print to check response status
      print("Response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];
        newsForYouList.clear();

        for (int i = 0; i < articles.length && i < 10; i++) {
          newsForYouList.add(NewsModel.fromJson(articles[i]));
        }
      } else if (response.statusCode == 403) {
        print("Access Denied: Check your API key or permissions.");
      } else {
        print("Something went wrong, Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isnewsForyouLoading.value = false;
    }
  }
}
