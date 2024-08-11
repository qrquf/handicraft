import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/Modal%20class/sellermodal1.dart';
import 'package:ecommerce/Modal%20class/sellmdal1.dart';
import 'package:ecommerce/Seller/seller%20registration/sellersign.dart';
//import 'package:ecommerce/Seller/seller%20registration/sellersign.dart';

class postApiHttp {
  final String baseUrl = "http://handy.ludokingatm.com/sellerapi.php";

   saveData(String first, String second, String last,
      String country,String business,String website,String number,
      String email,String City,String product,String pincode,String state,String country_code) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    request.fields.addAll({
      'first': first,
      'second': second,
      'last': last,
      'country': country,
      'bussiness':business,
      'website':website,
      'email':email,
      'number':number,
     'city':City,
      
      'product':product,
      'pincode':'226022',
      'state':state,
      'country_code':'79'

          });
    
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(request.fields);
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

Future saveData2(var email,var password) async
{
 var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/sellerlogin.php")); 
  request.fields.addAll({
    'email':email,
    'password':password
  });
   http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    String s='''"success"''';
      print(request.fields);
      var f=await response.stream.bytesToString();
      print(f );
if(s==f){
  return 0;

}
else{
  return 1;
}

    }
    else {
      print(response.reasonPhrase);
    }
  
}

Future<List<sellmode>> getAllPost(var x) async {
    Response res = await get(Uri.parse("http://handy.ludokingatm.com/sellershowapi.php/?email="+x.toString()));
    
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      //print(data);
    
      List<sellmode> allPost =
          data.map((dynamic item) => sellmode.fromJson(item)).toList();
          print(allPost[0].id.toString());
      return allPost;
    } else {

      throw "Something Went Wrong";
    }
  }
  Future<List<sellmodal1>> getAllPost1(var x) async {
    Response res = await get(Uri.parse("http://handy.ludokingatm.com/sellshowapi.php/?id="+x));
    
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      //print(data);
    
      List<sellmodal1> allPost =
          data.map((dynamic item) => sellmodal1.fromJson(item)).toList();
          print(allPost[0].id.toString());
      return allPost;
    } else {

      throw "Something Went Wrong";
    }
  }
  
}