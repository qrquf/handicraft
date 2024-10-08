
import 'package:ecommerce/Api/subghttp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/Api/sellerhttp.dart';
import 'package:ecommerce/OnlineShopping/ForgotPassword.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
import 'package:ecommerce/Seller/seller%20registration/sellersign.dart';
import 'package:ecommerce/Seller/updateform.dart';
import './sellerlogin.dart';
import 'package:intl/intl.dart';
class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  State<LoginPage1> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(
      leading:IconButton(
        onPressed: () {Navigator.pop(context);},
      icon:Icon(Icons.arrow_back)
      
      ),
      
    ),
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
                  "Enter Seller id",
                  Icons.person_outline,
                  false,
                  _emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                /*reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  _passController,
                ),*/
                const SizedBox(
                  height: 20,
                ),
                buttons(
                  context,
                  "Log In",
                  () async{
                    postApiHttp http=postApiHttp();
                    int j=await http.saveData2(_emailController.text.toString(),_passController.text.toString());
                  if(j==0)
                  {
                    
                                        DateTime d=DateTime.now();
                 	DateTime date=DateTime.now();
  String format=DateFormat('yyyy-MM-dd').format(date);
  DateTime ss=DateTime(date.year,date.month,date.day-100);
  String format1=DateFormat('yyyy-MM-dd').format(ss);
  print(format1);
  httpServices21 htp=httpServices21();
  var p=await htp.del(_emailController.text.toString(),format1);
  if(p!=-1)
  {
    print("ffgg");
   
                 await   Navigator.push(
                           context,
                            MaterialPageRoute(
                               builder: (context) => 
    update(id1:p.toString(),date1: format1,emm: _emailController.text,idp:"hello")));

  }
  else
  {
                    Navigator.push(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  Dashboard(em:_emailController.text.toString()),
                             ),
                           );
                  
                 }
                           
         }
                  else{
                     showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Invalid email entered"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},))));
                    }
                  
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
                  },
                ),
                SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Sellersign(),
                          ),
                        );
                    },child:const Text(
                      "SignUp/",
                      style: TextStyle(
                        color: Color.fromARGB(255, 215, 149, 149),
                      ),
                      
                    )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Sellersign(),
                          ),
                        );
                      },
                      child:InkWell(onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Sellersign(),
                          ),
                        );

                      },child: Text(
                        " Sign in",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      )
              /*  Padding(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                      onPressed: () {Navigator.pushReplacement(
                            context,
                             MaterialPageRoute(
                               builder: (context) => Dashboard(),
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
                       /*   const SizedBox(width: 5,),
                          Text("Log in with Google",style: GoogleFonts.acme(textStyle: const TextStyle(color: Colors.black)),),
                          const Spacer(),
                          Image.asset("GoogleLogo.png", width: 25,height: 25,)
                        ],
                      )),
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Sellersign(),
                          ),
                        );
                    },child:const Text(
                      "SignUp/",
                      style: TextStyle(
                        color: Color.fromARGB(255, 215, 149, 149),
                      ),
                      
                    )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Sellersign(),
                          ),
                        );
                      },
                      child:InkWell(onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Sellersign(),
                          ),
                        );

                      },child: Text(
                        " Sign in",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      )
                )],
                ),
              ],
            ),
          ),
        ),*/
            )]),
  ])))));
  }
}
