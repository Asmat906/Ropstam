
// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../action/sign_up_action.dart';
// import '../views/login_user_information_task1.dart';

// class LoginController extends GetxController {
//   GetStorage box = GetStorage();
//   var logindata;
//   var resultInvalid = false.obs;
//   RxBool isLoading = false.obs;
//   loginUserdata(data) async {
//     isLoading(true);
//     await simplelogin(data).then((res) {
//       logindata = jsonDecode(res.body);
//       if (res.statusCode == 200 || res.statusCode < 400) {
//         box.write('access_token', logindata['data']['token']);
//         box.write('email', logindata['data']['user']['email']);
//         box.write('address', logindata['data']['user']['address']);
//         box.write('name', logindata['data']['user']['name']);
//         // box.write('login_id', logindata['data']['user']['id']);
//         //here Use All information
//         box.write('user', logindata['data']);
//         box.write('id', logindata['data']['user']['id']);
//         box.write('user_id', logindata['data']['user_id']);
//         box.write('username', logindata['data']['user']['username']);
//         box.write('name', logindata['data']['user']['name']);
//         box.write('email', logindata['data']['user']['email']);
//         box.write('user_type', logindata['data']['user_type']);
//         box.write('mobile', logindata['data']['user']['mobile']);
        
//         print("><><><><>statusCode<><><><><${logindata['data']['user']}");
//         resultInvalid(false);
//         isLoading(false);
//         Get.to(UserInformation());
//       } else if (logindata['success'] == false) {
//         resultInvalid(true);
//         isLoading(false);
//       }
//     });
//     update();
//   }
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../action/sign_up_action.dart';
import '../views/login_user_information_task1.dart';

class LoginController extends GetxController {
  GetStorage box = GetStorage();
  var logindata;
  var subDom;
  var usertype;
  var result = true;
  var resultInvalid = false.obs;
  RxBool isLoading = false.obs;
  loginUserdata(data) async {
    isLoading(true);
    await simplelogin(data).then((res) {
      logindata = jsonDecode(res.body);
      print("<><><><>FFF<><><FF><><F>F<F><><>$logindata");
      if (res.statusCode == 200 || res.statusCode < 400) {
        box.write('access_token', logindata['data']['token']);
        box.write('email', logindata['data']['user']['email']);
        box.write('address', logindata['data']['user']['address']);
        box.write('name', logindata['data']['user']['name']);
        // box.write('login_id', logindata['data']['user']['id']);
        box.write('user_image', logindata['data']['user']['image']);
        box.write('user_id', logindata['data']['user_id']);
        box.write('country_id', logindata['data']['user']['country_id']);
        box.write('city_id', logindata['data']['user']['city_id']);
        box.write('region_id', logindata['data']['user']['region_id']);
        box.write('user_type', logindata['data']['user_type']);
        box.write('account_type', logindata['data']['user']['account_type']);
        resultInvalid(false);
        isLoading(false);
        //Get.to(BottomTabs());
        Get.to(UserInformation());
      } else if (logindata['success'] == false) {
        print("><><><><><><GGGGGGGGGGGGGGGGGGGGGG><><><$logindata");
        resultInvalid(true);
        isLoading(false);
      }
    });
    update();
  }

}