import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ropstam_task/src/Widget/controller/sign_up_controller.dart';

import '../../../main.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key ?key, }) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
 GetStorage box = GetStorage();

  //final banner = Get.put(LoginController());
  var check;
  void initState() {
    // banner.LoginController();
    check=box.read("access_token");
   // jbl= banner.loginUserdata(jjjjj);
   // print("<><><><>GGGRRRRRRRRRRRRRRR><><><>$jj");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: (){
            box.remove("access_token");
            Get.offAll(TaskPages());
          }, icon: Icon(Icons.logout))],
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
          title: const Text('Task 1 User Detail'),
          
        ),
        body: Center(
          child: 
          GetBuilder<LoginController>(
            init: LoginController(),
            builder: (val) {
              if (val.logindata!=null) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: 
                      Padding(padding: new EdgeInsets.all(10.0),
                      child: new Card(
                        color: Colors.grey,
                        child:  Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 70,
                               //backgroundColor: Colors.white,
                                backgroundImage: //Image.asset("assets/Ropstam-solutions.png")
                                NetworkImage("${val.logindata['data']['user']['image']}",),
                              ), 
                              Align(
                                alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("ID ="+'${val.logindata['data']['user']['id']}', style:TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold )),
                                  )
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("USER NAME ="+'${val.logindata['data']['user']['username']}', style:TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold )),
                                )
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("NAME ="+'${val.logindata['data']['user']['name']}', style:TextStyle(color:Colors.yellow,fontSize:15,fontWeight: FontWeight. bold )),
                                )
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("EMAIL ="+'${val.logindata['data']['user']['email']}', style:TextStyle(color:Colors.yellow,fontSize:15,fontWeight: FontWeight. bold )),
                                )
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("MOBILE NO ="+'${val.logindata['data']['user']['mobile']}', style:TextStyle(color:Colors.yellow,fontSize:15,fontWeight: FontWeight. bold )),
                                )
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Address ="+'${val.logindata['data']['user']['address']}', style:TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold )),
                                )
                              ),
               
                              
                            ],
                          ),
                        ),
                      )
                    )
                 // }
               // )
              );
              } 
              else if (val.logindata==null) 
              {
               return Text("Errrrrrrroooooorrrrrr");
              }
            return CircularProgressIndicator();
          }),
       
        ),
      
    );
  }
   
}