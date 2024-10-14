import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/bottomnavigationcontroller.dart';

class Navigationbar extends StatelessWidget {
  const Navigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavcontroller controller = Get.put(Bottomnavcontroller());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      controller.index.value = 0;
                    },
                    child: Obx(() => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 35,
                        width: 40,
                        decoration: BoxDecoration(
                            color: controller.index.value == 0
                                ? Colors.orange
                                : null,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 25,
                        )))),
                InkWell(
                    onTap: () {
                      controller.index.value = 1;
                    },
                    child: Obx(() => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: controller.index.value == 1
                                ? Colors.orange
                                : null,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.book,
                          color: Colors.white,
                          size: 25,
                        )))),
                InkWell(
                    onTap: () {
                      controller.index.value = 2;
                    },
                    child: Obx(() => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 35,
                        width: 40,
                        decoration: BoxDecoration(
                            color: controller.index.value == 2
                                ? Colors.orange
                                : null,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 25,
                        )))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
