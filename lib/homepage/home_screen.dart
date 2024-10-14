import 'package:intl/intl.dart'; // For date formatting
import 'package:flutter/material.dart';
import 'package:newsapp/commantext.dart';
import 'package:newsapp/controller/NewsController.dart';
import 'package:newsapp/homepage/widget/Newstile.dart';
import 'package:newsapp/homepage/widget/trandingcard.dart';
import 'package:get/get.dart';
import 'package:newsapp/pages/NewsDeatils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Function to format DateTime and handle null
  String formatDate(DateTime? date) {
    if (date == null) {
      return "Unknown Date"; // Fallback for null dates
    }
    return DateFormat('yyyy-MM-dd')
        .format(date); // Format date as Year-Month-Day
  }

  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.dashboard_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const Text(
                    "News App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Commontext(
                    text: "Hottest News",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  Commontext(
                    text: "See all",
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => newscontroller.istrandingLoading.value
                    ? CircularProgressIndicator()
                    : Row(
                        children: newscontroller.trandingNewsList
                            .map((e) => Trandingcard(
                                ontap: () {
                                  Get.to(Newsdeatils(
                                    newsModel: e,
                                  ));
                                },
                                imageUrl: e.urlToImage!,
                                tag: "Trending No 1",
                                title: e.title!,
                                author: e.author!,
                                time: formatDate(e
                                    .publishedAt))) // Dynamic date from e.publishedAt
                            .toList(),
                      )),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Commontext(
                    text: "News For You",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  Commontext(
                    text: "See all",
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => newscontroller.isnewsForyouLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                      children: newscontroller.newsForYouList
                          .map((e) => Newstile(
                              ontap: () {
                                Get.to(Newsdeatils(newsModel: e));
                              },
                              title: e.title!,
                              author: e.author ?? "Unknown",
                              time: formatDate(e.publishedAt),
                              // Dynamic date from e.publishedAt
                              imageUrl: e.urlToImage ??
                                  "https://www.hindustantimes.com/ht-img/img/2024/10/07/550x309/Prime-Minister-Narendra-Modi-and-Maldives-Presiden_1728317636195_1728317752751.jpg"))
                          .toList(),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
