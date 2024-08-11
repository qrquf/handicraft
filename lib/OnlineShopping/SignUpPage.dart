//import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/AAAAAA/new.dart';
import 'package:ecommerce/Api/Api_connection.dart';
import 'package:ecommerce/Modal%20class/subghttp.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/OnlineShopping/use.dart';
import 'package:ecommerce/Seller/updateform.dart';
import 'package:ecommerce/userer.dart';
import 'LoginPage.dart';
import 'package:http/http.dart';
import'';
import 'package:regexpattern/regexpattern.dart';
RegExp pass=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
class _SignUpPageState extends State<SignUpPage> {
    msg1(var d,context)
{
  final snackbar= SnackBar(content: Text(d),
  duration: Duration(seconds: 5),);
 ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
  
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            //foreground: Paint()..style=PaintingStyle.stroke..strokeWidth=2..color=Colors.red,

          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.limeAccent,
              Colors.blue,
              Colors.greenAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Name",
                  CupertinoIcons.person,
                  false,
                  _nameController,
                  
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Phone",
                  Icons.mobile_screen_share_rounded,
                  false,
                  _phoneController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter User Mail",
                  Icons.person_outline,
                  false,
                  _emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  _passController,
                ),
                const SizedBox(
                  height: 20,
                ),
                /*buttons(
                  context,
                  "Sign Up",
                  () {
                    validateEmail(context);
                    // FirebaseAuth.instance
                    //     .createUserWithEmailAndPassword(
                    //   email: _emailController.text,
                    //   password: _passController.text,
                    // )
                    //     .then(
                    //   (value) {
                    //     return showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: const Text("Congratulations 🎉🎉🎆🥳🥳"),
                    //           content: const Text(
                    //             "You have Signed Up Successfully...!!!",
                    //           ),
                    //           actions: [
                    //             TextButton(
                    //               child: const Text("OK"),
                    //               onPressed: () {
                    //                 Navigator.pushReplacement(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                     builder: (context) => const LoginPage(),
                    //                   ),
                    //                 );
                    //               },
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   },
                    // ).onError(
                    //   (error, stackTrace) {
                    //     return showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           title: const Text("OOPs...😒🙁☹🙃"),
                    //           content: Text(
                    //             error.toString(),
                    //           ),
                    //           actions: [
                    //             TextButton(
                    //               onPressed: () {
                    //                 Navigator.pop(context);
                    //               },
                    //               child: const Text(
                    //                 "Chala Jaa",
                    //                 style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 15,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   },
                    // );
                  },
                ),*/
                ElevatedButton(onPressed: () async {
                  if(_phoneController.text.length!=0 
                  && _emailController.text.length!=0
                  && _nameController.text.length!=0 
                  && _passController.text.length!=0)
                  {
                    if(_phoneController.text.length==10 && _phoneController.text.toString().isNumeric())
                    {   RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if(!regex.hasMatch(_passController.text.toString()))
                      {
                  httpServices21 htp=httpServices21();
                 int j= await htp.vali(_emailController.text.toString());
if(j==0)
{
                  SaveRecord(context);
                  }
                
                  

                  else
                  {
                    
                     Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("The Email id already exist"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));

                  }
                }
                  else
                  {
                    
                     Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("The Password entered is of invalid format"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));

                  }}
                else
                {
                  Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Invalid phone no"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));

                }
                }
                else
                {
                   Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Fields can not be left blank"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));
                }},
                   child: Text("submit")),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(x:0),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    
    );
    
  }
}

validateEmail(context) async
{ 
List<userser> f=await populatedata();
//print(f[2]);
 // print(list[1].email.toString());

  
/*  Response res=await http.post(Uri.parse(Api.validate));
  if(res.statusCode==200)
  {
    List<dynamic> data=jsonDecode(res.body);
    List<userser> allPost=data.map((dynamic item)=>userser.fromJson(item)).toList();
    return allPost;

  }
  else{
    throw "Something went wrong";
  }
*/
}  
Future<List<userser>> populatedata() async
{Response res=await http.post(Uri.parse("http://handy.ludokingatm.com/usershowapi.php"));
  if(res.statusCode==200)
  {
    //List<dynamic> data=jsonDecode(res.body);
    List<userser> allPost=[jsonDecode(res.body)].map((dynamic item)=>userser.fromJson(item)).toList();
    if(allPost.length==1)
    {
      print("no data found");
    }if(allPost.isEmpty)
    {
      print("no data found");
    }
    print(allPost[0]);
    return allPost;

  }
  else{
    throw "Something went wrong";
  }

}




  
  /*catch(e){ showDialog(context: context, builder: ((context) =>
      AlertDialog(
        content: Text("The Email id ALready exist please try using another email id"),
        actions: [ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("O.K"))],

      )));
      print(e);

  }
}*/
SaveRecord(context) async
{
User user= User(_nameController.text.trim(),_emailController.text.trim(),_passController.text.trim(),_phoneController.text.trim());
try{
var res=await http.post(Uri.parse(
  Api.signUp
),body:user.toJson());
if(res.statusCode==200)
{
  //var resBody1=jsonDecode(res.body);
  String resBody=res.body;
    if((resBody)=="false")
  {
 AlertDialog(
        content: Text("Record Saved"),
        actions: [ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("O.K"))],

      );    
  }
  else{
    AlertDialog(
        content: Text("Record not Saved"),
        actions: [ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("O.K"))],

      );    
  }
}
else{
  AlertDialog(
        content: Text("Record Saved"),
        actions: [ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("O.K"))],

      );    
}
}
catch(e){
  print(e);
}
}
