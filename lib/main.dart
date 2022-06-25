import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ropstam_task/detail_listview_task2.dart';
import 'package:ropstam_task/src/Widget/views/login_task1.dart';
import 'package:ropstam_task/src/Widget/views/login_user_information_task1.dart';
import 'src/Widget/utils/routing.dart';
var auth;
void main()async {
  getData();
   runApp(MyApp());}
   GetStorage box = GetStorage();
getData() async{
  auth = await box.read('access_token');
  print(",.,.,.,.,.,.,.,.,.,.,.${auth}");

}

class MyApp extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    auth =  box.read('access_token');
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: Colors.blue,
         textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
           bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
         ),
      ),
      debugShowCheckedModeBanner: false,
      // home: WelcomePage(),
        // home: TaskPages(),
        initialRoute:  auth == null ? '/taskScreen' : '/userinformation',
              //initialRoute:  auth == null? TaskPages()   : UserInformation(),
        onGenerateRoute: GardnerRoutes.gardnerRoutes,
    );
  }
  
}
class TaskPages extends StatefulWidget {
  const TaskPages({Key? key}) : super(key: key);

  @override
  State<TaskPages> createState() => _TaskPagesState();
}

class _TaskPagesState extends State<TaskPages> {
  GetStorage box = GetStorage();
  @override
  var check;
  void initState() {
    // TODO: implement initState
    check=box.read("access_token");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      home: Scaffold(  
          appBar: AppBar(  
            backgroundColor: Colors.orangeAccent,
            centerTitle: true,
            title: Text('Clik one by one Roopstam Task'),  
          ),  
          body: Center(child: Column(children: <Widget>[  
            Container(
              padding: EdgeInsets.all(15),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                color: Colors.orangeAccent,
                onPressed: () { Get.to(SignUpPage()); },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [
                    Text("Login/Task1"),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                color: Colors.orangeAccent,
                onPressed: () { 

                  Get.to(DetailApiPage()); 
                  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [
                    Text("Post Api Response/Task2"),
                  ],
                ),
              ),
            ), 
            Container(
              padding: EdgeInsets.all(15),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                color: Colors.orangeAccent,
                onPressed: () { 
                  //  check=box.read("access_token");
                  // check!=null?
                 // Get.to(UserInformation());
                  //:null;
                 },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [
                    Text("User Session/Task3 Appliied in Task 2"),
                  ],
                ),
              ),
            ), 
              
          ]  
         ))  
      ),  
    );
   
  }
}
