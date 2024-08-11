import 'dart:convert';
import 'dart:ui';
import 'package:ecommerce/AAAAAA/postmode.dart';
import 'package:ecommerce/AAAAAA/xyz.dart';
import 'package:http/http.dart';
var did;
class HttpServices
{
  HttpServices({uid})
  {did=uid;}
  final String baseUrl="https://jsonplaceholder.typicode.com/photos/?id=";
Future<List<pictures>> getAllPost() async{
  Response res=await get(Uri.parse(baseUrl+did.toString()));
  if(res.statusCode==200)
  {
    List<dynamic> data=jsonDecode(res.body);
    List<pictures> allPost=data.map((dynamic item)=>pictures.fromJson(item)).toList();
    return allPost;

  }
  else{
    throw "Something went wrong";
  }
}  

}