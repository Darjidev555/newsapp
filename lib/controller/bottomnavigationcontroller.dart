import 'package:get/get.dart';
import 'package:newsapp/homepage/home_screen.dart';
import 'package:newsapp/pages/articles/Articalpage.dart';
import 'package:newsapp/pages/profile.dart';

class Bottomnavcontroller extends GetxController {
  RxInt index = 0.obs;
  var pages = [
    HomeScreen(),
    Articalpage(),
    Profile(),
  ];
}
