import 'dart:ffi';
import 'package:ecommerce/AAAAAA/prog.dart';
import 'package:ecommerce/Seller/AddProduct.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
import 'package:ecommerce/footer.dart';
import 'package:ecommerce/logo.dart';
import 'package:ecommerce/AAAAAA/new.dart';
import 'package:ecommerce/payment.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:ecommerce/new2.dart';
//import'./logo.dart';

class Local extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body:Center(
      child:Column(
        children:[
          ElevatedButton(onPressed: () {
            Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  Screen2(),
                             ),
                           );
          }, child: Text("hello there"))
        ]
      )
    )
   );
  }
  
}
class Screen2 extends StatelessWidget
{
var ss3;

    
  void xyz() async
  {sharedref ss1=sharedref();
  ss1.addString("hhh", 35);
  String? ssd=await ss1.getString1("hhh").toString();
 ss3=ssd;

  }
  @override
  Widget build(BuildContext context) {
    sharedref ss=sharedref();
  ss.addString("hhh", 35);
  var d= ss.getString("hhh",10);
 return FutureBuilder(
  future:ss.getString("hhh", 34),
  
  builder: ((context, snapshot) {
    
    return xxx(context,snapshot.data!);
  }));


  }

xxx(
  BuildContext context,
  int ss
)
{xyz();
  return Center(

    child:Column(
      children:[
    ElevatedButton(onPressed:(){
        Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  Screen1(),
                             ),
                           );
    },child:Text("bye there"+ss3.toString()))
  ]));
}}
class sharedref {
  void addString(String key,int value) async
  {
    SharedPreferences sh=await SharedPreferences.getInstance();
    sh.setInt(key, value);

  }
   Future<int?>getString(String key,int value) async
  {
    SharedPreferences sh=await SharedPreferences.getInstance();
  int?c=  sh.getInt(key);
  print(c);
return c;

  }
 Future<bool?> geBool(String key,bool value) async
  {
    SharedPreferences sh=await SharedPreferences.getInstance();
   bool? b= sh.getBool(key);
   return b;

  }
 Future<double?> gedouble(String key,double value) async
  {
    SharedPreferences sh=await SharedPreferences.getInstance();
  double? value= sh.getDouble(key);
return value;
  }
  
 Future<String?> getString1(String key) async
 {
  print(key);
  SharedPreferences sh1=await SharedPreferences.getInstance();
  String? value= sh1.getString(key);
  print(value);
  return value;
 }  
}