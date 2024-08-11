import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/AAAAAA/prog2.dart';
class Screen1 extends StatefulWidget {
   Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String? name;
  String? email;
  String? phone;
  String? password;
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Post API"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (text)=>name=text,
              decoration: InputDecoration(
                label: Text("Name"),
              ),
            ),
            TextField(
              onChanged: (text)=>name=text,
              decoration: InputDecoration(
                label: Text("Name"),
              ),
            ),
            TextField(
              onChanged: (text)=>phone=text,
              decoration: InputDecoration(
                label: Text("Number"),
              ),
            ),
            TextField(
              onChanged: (text)=>email=text,
              decoration: InputDecoration(
                label: Text("E-mail"),
              ),
            ),
            TextField(
              onChanged: (text)=>password=text,
              decoration: InputDecoration(
                label: Text("Password"),
              ),
            ),
            ElevatedButton(onPressed: (){
            postApiModel http=postApiModel();
            http.getallPosts(name,email,phone,password
            );
            }, child: Text("Send"))
          ],
        ),
      ),
    );
  }
}