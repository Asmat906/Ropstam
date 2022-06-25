import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropstam_task/src/Widget/controller/sign_up_controller.dart';
import 'package:ropstam_task/src/Widget/utils/customized_button.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key ?key, this.title}) : super(key: key);

  final String? title;

 
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
  final formKey = GlobalKey<FormState>();

  //  GetStorage box = GetStorage();
  String? name,email,passWord,userName;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool _passwordVisible = false;
  var devicetoken;
class _SignUpPageState extends State<SignUpPage> {
  
 void initState() {
  
    // banner.LoginController();
    //var jjjjj=box.read("user");
   // jbl= banner.loginUserdata(jjjjj);
   // print("<><><><>GGGRRRRRRRRRRRRRRR><><><>$jj");
    devicetoken="zasdcvgtghnkiuhgfde345tewasdfghjkm";
    super.initState();
  }

  Widget CustomUi(){
    return  Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/Ropstam-solutions.png"),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration("Enter user Name",),
                    validator: (String ?value){
                      if(value!.isEmpty)
                      {
                        return 'Please a Enter Email';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (String ?value){
                      email = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    controller: passController,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration("PassWord",Icons.visibility),
                    validator: (String ?value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    onSaved: (String ?value){
                      name = value;
                    },
                  ),
                ),
             
              ],
            ),
          
        );
  }
  
  void createUser() {
    
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      var json = {
        'email':emailController.text,
        'password':passController.text,
        'device_token':devicetoken
      };
       print("json of tyhe student.............$devicetoken");
        print("json of usernameController student.............${emailController.text}");
         print("json of passController student.............${passController.text}");
       loginCont.loginUserdata(json);
    }
  }

  
  Widget _submitButton() {
    return GestureDetector(
      onTap: createUser,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
              child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
       onTap: () {
      //   Navigator.push(
      //       // ignore: missing_required_param
      //       context, MaterialPageRoute(builder: (context) => DetailApiPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
   
  final loginCont = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
          appBar: AppBar(  
            backgroundColor: Colors.orangeAccent,
            centerTitle: true,
            title: Text('Roopstam Task'),  
      ), 
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   // SizedBox(height: height * .2),
                    SizedBox(
                      height: 50,
                    ),
                     CustomUi(),
                    _submitButton(),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
           // Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
