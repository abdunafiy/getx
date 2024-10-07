import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  // Getter untuk `changeIndexMenu`
  void changeIndexMenu(int index) {
    selectedIndex.value = index;
  }
}
