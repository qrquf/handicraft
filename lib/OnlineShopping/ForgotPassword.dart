import 'dart:math';

import 'package:ecommerce/Api/subghttp.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/Api/transhttp.dart';
import 'package:ecommerce/OnlineShopping/LoginPage.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:google_fonts/google_fonts.dart';
httpServices20 http=httpServices20();
Random x=new Random();
int g=x.nextInt(3000000);
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}
final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
class ForgotPasswordState extends State<ForgotPassword> {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Online Shopping Forgot password",
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(CupertinoIcons.arrow_left),
        //   ),
        //   title: const Text(
        //     "Forgot Password",
        //   ),
        // ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.deepPurple,
            Colors.red,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          padding: EdgeInsets.only(
           // top: MediaQuery.of(context).size.height * 0.1,
            left: 35,
            right: 35,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Forgot Password",
                      style: GoogleFonts.laila(textStyle: const TextStyle(color: Colors.white,fontSize: 25))
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                ),
                reusableTextField(
                  "Email",
                  Icons.email_outlined,
                  false,
                  _emailController,
                ),

                const SizedBox(
                  height: 15,
                ),
                buttons(
                  context,
                  "OK",
                  () async{
                    httpServices21 htp=httpServices21();
                   int j=await  htp.vali(_emailController.text);
                    if(j==1)
                    {
                    print(g);
                    http.otp(
                      _emailController.text.toString()
                    , "Your otp code is"+g.toString()+".");
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Otp(),
                      ),
                    );
                  
                 
                  }
                  else
                  {
                       Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("The Email does not exist "),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));

                  }},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


TextEditingController otp=TextEditingController();
class Otp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: Colors.red,
      body:Padding(padding:EdgeInsets.all(30),child:Column(
      children:[
        reusableTextField(
                  "Enter otp send to your no",
                  Icons.email_outlined,
                  false,
                  otp,
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  child:Text("Submit"),
                  onPressed: ()  {
                    if(otp.text.toString()==g.toString())
                    {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  forget(),
                      ),
                    );

                    }
                     else
                  {
                     showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Incorrect Otp entered"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},))));
                  
                    
                  }

                  },
                ),
                SizedBox(height:20),
                ElevatedButton(onPressed: () {
                    http.otp( 
                      _emailController.text.toString()
                    , "Your otp code is"+g.toString()+".");
                }, child: Text("resend otp"))
                ]
                )
                ));

  }

}

class forget extends StatelessWidget
{@override

  Widget build(BuildContext context)
  {return Scaffold(
  body:Container( decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.deepPurple,
            Colors.red,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    child: 
    Padding(padding: EdgeInsets.all(30),child:Column(
      
    children:[
                reusableTextField(
                  "New Password",
                  Icons.password_sharp,
                  true,
                  _newPassController,
                ),
                const SizedBox(
                  height: 15,
                ),
                reusableTextField(
                  "Confirm Password",
                  Icons.password_sharp,
                  true,
                  _confirmPassController,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () async{
                  int j=await http.changepass(_emailController.text.toString(),_newPassController.text.toString());
                  if(j==0)
                  {
                   Future.delayed(Duration.zero,()=>  showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Successfully changed password"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));
                  Navigator.pop(context);
                  }
                  else
                  {
                    Future.delayed(Duration.zero,()=>  showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Something went wrong"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));
                  }
                }, child: Text("submit"))
    ]))));
  }
}

ForgotAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey,
        title: const Text(
          "Congratulations",
        ),
        content: const Text("Your password has been changed successfully"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("OK"))
        ],
      );
  },
  );
}
