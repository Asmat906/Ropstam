import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ropstam_task/detail_listview_task2.dart';
import '../../../main.dart';
import '../views/login_task1.dart';
import '../views/login_user_information_task1.dart';
const String signup = '/signup';
 const String detailPage = '/detailPage';
const String home = '/home';
const String taskScreen = '/taskScreen';
const String userinformation = '/userinformation';
GetStorage box = GetStorage();
class GardnerRoutes {
  static Route<dynamic> gardnerRoutes(RouteSettings settings) {
    var auth = box.read('access_token');
    switch (settings.name) {
      case signup:
      return MaterialPageRoute(builder: (_) => SignUpPage());
      case detailPage:
      return MaterialPageRoute(builder: (_) => DetailApiPage());
      case taskScreen:
      return MaterialPageRoute(builder: (_) => TaskPages());
      case userinformation:
      return MaterialPageRoute(builder: (_) => UserInformation());
      
      default:
      //return MaterialPageRoute(builder: (_) => SignUpPage());
       return MaterialPageRoute(builder: (_) => auth == null ? TaskPages() : UserInformation());
    }
  }
}
