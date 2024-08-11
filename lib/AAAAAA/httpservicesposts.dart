import 'dart:convert';
import 'package:http/http.dart';
import 'package:ecommerce/AAAAAA/postmode.dart';
var dd;
class   httpServices1 {
  httpServices1({dd1})
  {
    dd=dd1;
  }

  final String baseUrl = "https://jsonplaceholder.typicode.com/posts/?userId=";

  Future<List<postmode>> getAllPost() async {
    Response res = await get(Uri.parse(baseUrl+dd.toString()));
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      List<postmode> allPost =
          data.map((dynamic item) => postmode.fromJson(item)).toList();
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
}
	
