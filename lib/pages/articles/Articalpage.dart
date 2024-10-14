import 'package:flutter/material.dart';
import 'package:newsapp/controller/NewsController.dart';
import 'package:newsapp/homepage/widget/Newstile.dart';
import 'package:newsapp/pages/NewsDeatils.dart';
import 'package:newsapp/pages/articles/SearchWidget.dart';
import 'package:get/get.dart';

class Articalpage extends StatelessWidget {
  const Articalpage({super.key});

  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    return Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Searchwidget(),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Column(
                    children: newscontroller.newsForYouList
                        .map((e) => Newstile(
                            ontap: () {
                              Get.to(Newsdeatils(newsModel: e));
                            },
                            title: e.title!,
                            author: e.author ?? "Unknown",
                            time: e.publishedAt.toString(),
                            imageUrl: e.urlToImage ??
                                "https://www.hindustantimes.com/ht-img/img/2024/10/07/550x309/Prime-Minister-Narendra-Modi-and-Maldives-Presiden_1728317636195_1728317752751.jpg"))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
