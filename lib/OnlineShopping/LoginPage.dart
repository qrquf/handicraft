//import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/Modal%20class/sellerhttp.dart';
import 'package:ecommerce/Modal%20class/subghttp.dart';
import 'package:ecommerce/Modal%20class/userhttp.dart';
//import 'package:ecommerce/Modal%20class/userhttp.dart';
import 'package:ecommerce/OnlineShopping/ForgotPassword.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/LatestProducts.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:ecommerce/stat.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:intl/intl.dart';
import 'SignUpPage.dart';
int i=0;
var j=0;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

class LoginPage extends StatefulWidget {
  var x;
LoginPage({x})
  {
    j=x;

  }
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  
   RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
        String s="enter password";
        
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.limeAccent, Colors.blue, Colors.greenAccent],
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
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
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    helperText: s
                  ),
                  
                onSaved:(value) {
                  if(!regex.hasMatch(value.toString())
                  )
                  {
                    s="Enter valid password";
                  
                  }
                  else
                  {
                    
                  }
                }  
                ),
                  
                
                //reusableTextField(
                  //"Enter Password",
                  //Icons.lock_outline,
                  //true,
                  //_passController,
                //)
                
                const SizedBox(
                  height: 20,
                ),
                
                buttons(
                  context,
                  "Log In",
                  () async{
                    state p=state();
                    
                    postApiHttp1 http=postApiHttp1();
                    await http.saveData(_emailController.text.toString(),_passController.text.toString());
                    j=await http.givedata(0);
                    if(j==0)
                    {
                      DateTime d=DateTime.now();
                 	DateTime date=DateTime.now();
  String format=DateFormat('yyyy-MM-dd').format(date);
  DateTime ss=DateTime(date.year,date.month-1,date.day-1);
  String format1=DateFormat('yyyy-MM-dd').format(ss);   
                  httpServices21 htp=httpServices21();
                htp.del1(format1);
                    Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  OnlineShopping(
                               _emailController.text.toString(),_passController.text.toString(),),
                             ),
                           );
                          
                  
                    }
                    
                    else{
                  showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Invalid email or password entered"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},))));
                    }}
                    // FirebaseAuth.instance
                    //     .signInWithEmailAndPassword(
                    //       email: _emailController.text,
                    //       password: _passController.text,
                    //     )
                    //     .then(
                    //       (value) => Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const OnlineShopping(),
                    //         ),
                    //       ),
                    //     )
                    //     .onError(
                    //   (error, stackTrace) {
                    //     return showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           title: const Text("OOPs...😒🙁☹🙃"),
                    //           content: const Text(
                    //               "Wrong UserId or Password or Don't have account 💀☠👽"),
                    //           actions: [
                    //             TextButton(
                    //               onPressed: () {
                    //                 Navigator.pop(context);
                    //               },
                    //               child: const Text(
                    //                 "Chala Jaa",
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 15),
                    //               ),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   },
                    // );
                ,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(175, 0, 0, 0),
                  child: Align(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                const Text("OR"),
             /*   SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                      onPressed: () {Navigator.pushReplacement(
                            context,
                             MaterialPageRoute(
                               builder: (context) =>  OnlineShopping(_emailController.text,_passController.text),
                             ),
                         );
                        // await GoogleSignInSignUpMethod().signInWithGoogle();
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const OnlineShopping(),
                        //   ),
                        // );
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        backgroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.black26;
                            }
                            return Colors.white;
                          },
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          Text("Log in with Google",style: GoogleFonts.acme(textStyle: const TextStyle(color: Colors.black)),),
                          const Spacer(),
                          Image.network("https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=893&height=600&name=image8-2.jpg", width: 25,height: 25,)
                        ],
                      )),
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        " Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 Xyz(context)
{
  if(i==1)
  {
    return 
                buttons(
                  context,
                  "Log In",
                  () {
                  
                    Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  OnlineShopping(_emailController.text,_passController.text),
                             ),
                           );
                  });
  }
                  
    
  else
  {
    return buttons(
                  context,
                  "Log In",
                () {});
  }
}