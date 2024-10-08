import 'dart:convert';
//import 'dart:js';

//import 'package:flutter_post_api_app/postApiModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import'package:http/http.dart';
import 'package:ecommerce/Modal%20class/userphotomodal.dart';
import 'package:ecommerce/Modal%20class/userphoto.dart';
import 'package:ecommerce/OnlineShopping/LoginPage.dart';
import 'package:ecommerce/Modal%20class/userermodal.dart';
final String baseUrl = "https://handy.ludokingatm.com/";
class postApiHttp1 {
  int m=0;
  List l=[];
  
 // final s={"result":"success","message":"1Records Found","data":[{"id":"23","name":"handy","number":"234567898","email":"handy@gmail.com","password":"handy"}]};
  final ss="null";

  //string f=s.toString();

  Future<int> givedata(int i) async
    {
      return m; 
      
    }

  Future<List> givedata5() async 
    {
      return l;
      
    }
    
  Future SaveRecord2(String name,String email,String number,
      String password) async
      {
        var request = http.MultipartRequest('POST', Uri.parse(baseUrl+"updateapi.php"));
    request.fields.addAll({
      'name': name,
      'number': number,
      'email': email,
      'password': password
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q=await response.stream.bytesToString();
      
      print(q);
      givedata(0);
  
     
    }
    else {
        
      print(response.reasonPhrase);
      final g=response.reasonPhrase;
        
      
givedata(1); 
      }

      }
       Future<List<userser>>getAllPost() async {
  
    http.Response res = await http.get(Uri.parse(baseUrl+"usershowapi.php"));
    if (res.statusCode == 200) {
      
      //Map<String,dynamic> data1 = jsonDecode(res.body);
      
List<dynamic> data = jsonDecode(res.body);
      List<userser> allPost =
          data.map((dynamic item) => userser.fromJson(item)).toList();
          print(allPost[0].number);
          print(allPost[0].id);
          //print(allPost[0].);
      //for(int i=0;i<allPost.length-1;i++)
      //{
       // l.add(allPost[i].name.toString());
        //l.add(allPost[i].email.toString());
        //l.add(allPost[i].number.toString());

        
        
    //}
    //List j=l;
    return allPost;
//    print(allPost[0].email);
    //return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
 
 Future<List<userser>>getuser() async {
  
    http.Response res = await http.get(Uri.parse(baseUrl+"usershowapi.php"));
    if (res.statusCode == 200) {
      
      //Map<String,dynamic> data1 = jsonDecode(res.body);
      
List<dynamic> data = jsonDecode(res.body);
      List<userser> allPost =
          data.map((dynamic item) => userser.fromJson(item)).toList();
          print(allPost[0].number);
          print(allPost[0].id);
          
        
        
    
    return allPost;
//    print(allPost[0].email);
    //return allPost;
    
    } else {
      throw "Something Went Wrong";
    }
  }
  
 Future savephoto(var id,var path) async
 {
  var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/userphoto.php"));
request.fields['id']=id;
 var pic3=await http.MultipartFile.fromPath("photos1",path);       
        request.files.add(pic3);
         http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q=await response.stream.bytesToString();
      
      print(q);
    return 0;
  
     
    }
    else {
        
      print(response.reasonPhrase);
      final g=response.reasonPhrase;
    return 1;
      }

 }
 
 Future<List<userphoto1>>getuser1(var ww) async {
  
    http.Response res = await http.get(Uri.parse("http://handy.ludokingatm.com/usershowphoto.php/?email="+ww.toString()));
    if (res.statusCode == 200) {
      
      //Map<String,dynamic> data1 = jsonDecode(res.body);
      
List<dynamic> data = jsonDecode(res.body);
      List<userphoto1> allPost =
          data.map((dynamic item) => userphoto1.fromJson(item)).toList();
          print(allPost[0].number);
          print(allPost[0].id);
          
        
        
    
    return allPost;
//    print(allPost[0].email);
    //return allPost;
    
    } else {
      throw "Something Went Wrong";
    }
  }
 
  Future<List<userser>>getAllPost3(var d) async {
  
    http.Response res = await http.get(Uri.parse("http://handy.ludokingatm.com/login2.php/?email="+d.toString()));
    if (res.statusCode == 200) {
      
      //Map<String,dynamic> data1 = jsonDecode(res.body);
      
List<dynamic> data = jsonDecode(res.body);
      List<userser> allPost =
          data.map((dynamic item) => userser.fromJson(item)).toList();
          print(allPost[0].number);
          print(allPost[0].id);
          //print(allPost[0].);
      //for(int i=0;i<allPost.length-1;i++)
      //{
       // l.add(allPost[i].name.toString());
        //l.add(allPost[i].email.toString());
        //l.add(allPost[i].number.toString());

        
        
    //}
    //List j=l;
    return allPost;
//    print(allPost[0].email);
    //return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
 
  Future<List<userser>> saveData2(String email,
      String password) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl+"login.php"));
    request.fields.addAll({
      //'name': name,
      //'number': number,
      'email': email,
      'password': password
    });
    http.StreamedResponse response = await request.send();

    
     
    
   // http.StreamedResponse response = await request.send();
 http.Response res = await http.get(Uri.parse(baseUrl+"login.php"));
    if (res.statusCode == 200) {
      
      Map<String,dynamic> data1 = jsonDecode(res.body);
      

    //if (res.statusCode == 200) {
      final q=await response.stream;
      
    List<dynamic> data = jsonDecode(res.body);
      List<userser> allPost =
          data.map((dynamic item) => userser.fromJson(item)).toList();
          print(allPost[0].number);
          return allPost;
     
    }
    else {
      throw "something went wrong";  
    //  print(response.reasonPhrase);
     // final g=response.reasonPhrase;
        
      
//givedata(1); 
      }
     

    }
      

  

	
  Future saveData(String email,
      String password) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl+"login1.php"));
    request.fields.addAll({
      //'name': name,
      //'number': number,
      'email': email,
      'password': password
    });
    String s='''"success"''';
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q=await response.stream.bytesToString();
      
      print(q);
      if(s==q.toString())
      {
        print("bye");
        print(s);
        m=0;
      givedata(0);
      }
      else
      {print("bb");
        m=1;
        givedata(1);
      }
    }
    else {
        m=1;
      print(response.reasonPhrase);
      final g=response.reasonPhrase;
        
      
givedata(1); 
      }
     

    }
    
}
  
  


 


Future alert(BuildContext context)
{
  return showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("rate our app"),
                  content:
                  ElevatedButton(child:Text("O.K"),onPressed:() {  Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) => LoginPage(x:1),
                             ),
                           );},)))
  );
}