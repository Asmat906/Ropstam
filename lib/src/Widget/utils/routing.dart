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
      // case adPostingScreen:
      // return MaterialPageRoute(builder: (_) => AddPostingScreen());
      // case tabs:
      // return MaterialPageRoute(builder: (_) => BottomTabs());
      // case homeAllOffer:
      // return MaterialPageRoute(builder: (_) => HomeAllOfferDEtailPage());
      // case friendPro:
      // return MaterialPageRoute(builder: (_) =>  FriendProfile());
      // case myOfferMain:
      // return MaterialPageRoute(builder: (_) => MyOfferDetailMain());
      // case chat:
      // return MaterialPageRoute(builder: (_) => ChattinPagePersonal());
      // case adverrtise:
      // return MaterialPageRoute(builder: (_) => AdvertisePage());
      // case notification:
      // return MaterialPageRoute(builder: (_) => NotificationPage());
      // case addOffers:
      // return MaterialPageRoute(builder: (_) => AddOffersPage());
      // case myAdd:
      // return MaterialPageRoute(builder: (_) => MyAdds());
      //   case userNoti:
      // return MaterialPageRoute(builder: (_) => NotifierUser());
      // case allAds:
      // return MaterialPageRoute(builder: (_) => AllAdds());
      // case offerList:
      // return MaterialPageRoute(builder: (_) => OfferList());
      // case DRAFT:
      // return MaterialPageRoute(builder: (_) => DraftAds());
      // case contact:
      // return MaterialPageRoute(builder: (_) => Contact());
      // case forgotCode:
      // return MaterialPageRoute(builder: (_) => ForgotCode());
      // case language:
      // return MaterialPageRoute(builder: (_) => Language());
      // case country:
      // return MaterialPageRoute(builder: (_) => Ccountry());
      // case resetPass:
      // return MaterialPageRoute(builder: (_) => ResetPassword());
      // case userAgrement: 
      // return MaterialPageRoute(builder: (_) => UserAgreement());
      // case location: 
      // return MaterialPageRoute(builder: (_) => MyLocations());
      // case favPage:
      // return MaterialPageRoute(builder: (_) => FavouritePage());
      // case forgot:
      // return MaterialPageRoute(builder: (_) => ForgotPassword());
      // case detailOffferPage:
      // return MaterialPageRoute(builder: (_) => OffersDetail());
      // case aboutUs:
      // return MaterialPageRoute(builder: (_) => AboutUs());
      // case adViewTab:
      // return MaterialPageRoute(builder: (_) => AdViewTab());
      // case inbox:
      // return MaterialPageRoute(builder: (_) => Inbox());
      // case friReq:
      // return MaterialPageRoute(builder: (_) => FriendReqList());
      // case userPro:
      // return MaterialPageRoute(builder: (_) => UserProfile());
      // case draweer:
      // return MaterialPageRoute(builder: (_) => AppDrawer());
      // case privacy:
      // return MaterialPageRoute(builder: (_) => Privacy());
      // case chooseLang:
      // return MaterialPageRoute(builder: (_) => ChooseLanguage());
      default:
      //return MaterialPageRoute(builder: (_) => SignUpPage());
       return MaterialPageRoute(builder: (_) => auth == null ? TaskPages() : UserInformation());
    }
  }
}