import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/AAAAAA/new.dart';
import 'package:ecommerce/AAAAAA/postmode.dart';
import 'package:ecommerce/Api/Api_connection.dart';
import 'package:ecommerce/Modal%20class/userhttp.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Profile%20Page/ProfilePage.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/OnlineShopping/use.dart';
import 'package:ecommerce/userer.dart';
//import 'LoginPage.dart';
import 'package:http/http.dart';
var x;
  var y;
  var z;
  var w;
class ProfileUpdate extends StatefulWidget {
   ProfileUpdate(em,ps,ph,nm)
  {
    _emailController.text=em;
    _passController.text=ps;
    _phoneController.text=ph;
    _nameController.text=nm;

    print(x);

  }
  @override
  _SignUpPageState1 createState() {
    return _SignUpPageState1();
  }

  
}
postApiHttp1 htp=postApiHttp1();
 TextEditingController _nameController = TextEditingController();
 TextEditingController _phoneController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
    TextEditingController _passController = TextEditingController();

class _SignUpPageState1 extends State<ProfileUpdate>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Material(
      child:Scaffold(
        appBar: AppBar(
          title:Text("update Your Profile"),
          leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: () {Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  ProfilePage(_emailController.text.toString(), _passController.text.toString(),""),
                             ),
                           );},),
        ),
        body:Container(
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
                /*reusableTextField(
                  "Enter User Mail",
                  Icons.person_outline,
                  false,
                  _emailController,
                )*/
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
                ElevatedButton(onPressed: () {
                htp.SaveRecord2(_nameController.text,_emailController.text,_phoneController.text,
                _passController.text);
                }, child: Text("submit")),
                const SizedBox(
                  height: 7,
                 )
                 ]
                 )
                 )
                 )
                 )
                 ));
  }

}
class _SignUpPageState extends State<ProfileUpdate> {
  
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Update Profile",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            //foreground: Paint()..style=PaintingStyle.stroke..strokeWidth=2..color=Colors.red,

          ),
        ),
      ),
      body: FutureBuilder<List<userser>>
      (
      
        future:htp.saveData2(x,y) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          //if(snapshot.hasData)
          
            List<userser>? picture2 = snapshot.data!;
            return ccy(context,picture2);
          
          //}
        
        //else{
          //return CircularProgressIndicator();
        //}
        }),

      )
        )
      
                 ;
  }
  Container ccy(BuildContext context,List<userser>posts)
  {_nameController.text=posts[0].name.toString();
  _emailController.text=posts[0].email.toString();
_phoneController.text=posts[0].number.toString();
_passController.text=posts[0].password.toString();
    return Container(
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
                /*reusableTextField(
                  "Enter User Mail",
                  Icons.person_outline,
                  false,
                  _emailController,
                )*/
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
                ElevatedButton(onPressed: () {
                htp.SaveRecord2(_nameController.text,_emailController.text,_phoneController.text,
                _passController.text);
                }, child: Text("submit")),
                const SizedBox(
                  height: 7,
                 )
                 ]
                 )
                 )
                 )
                 );
  }
}
