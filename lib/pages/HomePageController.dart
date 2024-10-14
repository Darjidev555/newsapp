import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/navigationbar.dart';
import '../controller/bottomnavigationcontroller.dart';

class Homepagecontroller extends StatelessWidget {
  const Homepagecontroller({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavcontroller controller = Get.put(Bottomnavcontroller());
    return Scaffold(
        backgroundColor: Colors.black54,
        floatingActionButton: Navigationbar(),
        body: Obx(() => controller.pages[controller.index.value]));
  }
}
