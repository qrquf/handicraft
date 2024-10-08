import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:ecommerce/Modal%20class/cartmodal.dart';
import 'package:ecommerce/Modal%20class/normalcartmodal.dart';
import 'package:ecommerce/Modal%20class/selectcartmodal.dart';
var dd;
class   httpServices14 {
  var uuid;
  var ppid;
  httpServices14({f,uid,pid})
  {
    uuid=uuid;
    ppid=pid;
    dd=f;
    print("prince");
    print(uuid);
    print(ppid);
    
  }

  final String baseUrl = "http://handy.ludokingatm.com/cartselect.php/?email=";

  Future<List<selectcart>> getAllPost(var ssd) async {
    Response res = await get(Uri.parse(baseUrl+ssd.toString()));
    
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      //print(data);
    
      List<selectcart> allPost =
          data.map((dynamic item) => selectcart.fromJson(item)).toList();
          print(allPost[0].id.toString());
      return allPost;
    } else {

      throw "Something Went Wrong";
    }
  }
  Future insertcart1(var id1,var id2) async {
    print(id1);

    print(id2);
     var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/cartselect1.php"));
    request.fields.addAll({
      'p_id': id2,
      'u_id': id1,
      //'email': email,
      //'password': password
    });
    String d='''"success"''';
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      
      
      final q=await response.stream.bytesToString();
      print(q);
      if(q==d)
      {
        return 1;

      }
    
    else
    {
      return 0;
      print(response.reasonPhrase);
    }
    }
}
  Future insertcart(var id1,var id2) async {
    print(id1);

    print(id2);
     var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/cartinsert.php"));
    request.fields.addAll({
      'p_id': id2,
      'u_id': id1,
      //'email': email,
      //'password': password
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      
      
      final q=await response.stream.bytesToString();
      print(q);
      print("bhak");
    }
    else
    {
      print(response.reasonPhrase);
    }
   
}
Future deletecart(var id1,var id2) async {
    print(id1);

    print(id2);
     var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/cartdelete.php"));
    request.fields.addAll({
      'p_id': id2,
      'u_id': id1,
      //'email': email,
      //'password': password
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      
      
      final q=await response.stream.bytesToString();
      print(q);
    }
    else
    {
      print(response.reasonPhrase);
    }
   
}
}
	