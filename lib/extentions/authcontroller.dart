

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller extends GetxController{
  var count = 0.obs;
  var s = 0.obs;
  increment(int auth) {
   return count=auth.obs;
  }
  sets(int auth) {
    return s=auth.obs;
  }
}