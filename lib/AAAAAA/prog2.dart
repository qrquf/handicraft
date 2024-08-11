import 'dart:convert';
//import 'dart:convert';

import 'package:http/http.dart';
import 'package:ecommerce/AAAAAA/progmodal.dart';
class postApiModel
{
  final String baseurl="http://handy.ludokingatm.com/userapi.php";
Future<List<prog>> getallPosts(name,email,phone,password) async {
  Response res = await post(Uri.parse(baseurl),body:jsonEncode(prog));
  if (res.statusCode == 200) {
    List<dynamic> data = jsonDecode(res.body);
    List<prog> allAlbums =data.map((dynamic item) => prog.fromJson(item)).toList();
    return allAlbums;
  } else {
    throw "Something went wrong";
  }
}

}