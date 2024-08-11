import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:ecommerce/Modal%20class/feedbackmodal.dart';
var dd;
class   httpfeed {
  httpfeed({dd1})
  {
  
  }

  //final String baseUrl = "https://handy.ludokingatm.com/feedbackinsert.php";

  Future SaveRecord2(var u_id,var p_id) async
      {
        print("hulu");
        print(u_id);
        print(p_id);
        var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/feedbackinsert.php"));
    request.fields.addAll({
      'u_id': u_id.toString(),
      'p_id': p_id.toString(),
      'Comment': "1",
      'Likes': "0",
      'Rating':"0"
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q=await response.stream.bytesToString();
      
      print(q);
        
     
    }
    else {
        
      print(response.reasonPhrase);
      final g=response.reasonPhrase;
        
      
      }
      }


  Future feedupdate(var u_id,var p_id,var comment,var likes,var rating) async
      {
        print("hulu");
        print(u_id);
        print(p_id);
        
        var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/feedbackupdate.php"));
    request.fields.addAll({
      'u_id': u_id.toString(),
      'p_id': p_id.toString(),
      'Comment': comment,
      'Likes': likes,
      'Rating':rating
    });
    http.StreamedResponse response = await request.send();
        
        
    if (response.statusCode == 200) {
      final q=await response.stream.bytesToString();
      
      print(q);
        
     
    }
    else {
        
      print(response.reasonPhrase);
      final g=response.reasonPhrase;
        
      
      }

      }
      Future feedSelect(var u_id1,var p_id1) async
      {
  var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/feedselect.php"));
    request.fields.addAll({
      'u_id': u_id1.toString(),
      'p_id': p_id1.toString(),
      
    });
    http.StreamedResponse response = await request.send();
        
        String s='''"success"''';
    if (response.statusCode == 200) {
      final q=await response.stream.bytesToString();
      
      print(q);
        if(s==q)
        {
          return 0;

        }
        else
        {
          return 1;
     
    }}
    else {
        
      print(response.reasonPhrase);
      final g=response.reasonPhrase;
        
      
      }
      

      }

Future<List<feedmodal>> getAllPost2(var u,var p) async {
    print(u);
    print(p);
    Response res = await get(Uri.parse("http://handy.ludokingatm.com/feedcon.php/?p_id="+p.toString()));
    print("ffff");
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      print('ppap');
      List<feedmodal> allPost =
          data.map((dynamic item) => feedmodal.fromJson(item)).toList();
          print(allPost[0].comment.toString());
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
  Future<List<feedmodal>> getAllPost1(var u,var p) async {
    print(u);
    print(p);
    Response res = await get(Uri.parse("http://handy.ludokingatm.com/feedbackshowapi1.php/?u_id="+u.toString()));
    print("ffff");
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      print('ppap');
      List<feedmodal> allPost =
          data.map((dynamic item) => feedmodal.fromJson(item)).toList();
          print(allPost[0].comment.toString());
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
}
	
