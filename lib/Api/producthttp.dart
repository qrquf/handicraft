import 'dart:convert';
import 'package:http/http.dart' ;
import 'package:http/http.dart' as http ;


import 'package:ecommerce/Modal%20class/productmodal.dart';
var dd;
var category="Wall Painting";
class   httpServices13 {
var y=0;
   final String baseUrl = "https://handy.ludokingatm.com/";
   final String baseUrl1 = "https://handy.ludokingatm.com/productshowapi1.php?category=";
   
sid()
{
return y;
}
  Future<List<prodModal>> getAllPost(var key) async {
    print("haan");
    print(key);
    Response res = await get(Uri.parse("http://handy.ludokingatm.com/productshowapi.php/?key="+key));
    if (res.statusCode == 200) {
      
      //Map<String,dynamic> data1 = jsonDecode(res.body);
      
List<dynamic> data = jsonDecode(res.body);
      List<prodModal> allPost =
          data.map((dynamic item) => prodModal.fromJson(item)).toList();
          print(allPost[0].category);
          y=allPost.length;
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
  Future<List<prodModal>> getAllPost3(var e) async {
    Response res = await get(Uri.parse("http://handy.ludokingatm.com/prodshowapi.php/?s_id="+e));
    if (res.statusCode == 200) {
      
      //Map<String,dynamic> data1 = jsonDecode(res.body);
      
List<dynamic> data = jsonDecode(res.body);
      List<prodModal> allPost =
          data.map((dynamic item) => prodModal.fromJson(item)).toList();
          print(allPost[0].category);
          y=allPost.length;
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
  Future<List<prodModal>> getAllPost1(var ss) async {
    Response res = await get(Uri.parse(baseUrl1+ss));
    if (res.statusCode == 200) {
      
      //Map<String,dynamic> data1 = jsonDecode(res.body);
      
List<dynamic> data = jsonDecode(res.body);
      List<prodModal> allPost =
          data.map((dynamic item) => prodModal.fromJson(item)).toList();
          print(allPost[0].category);
          y=allPost.length;
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
  
  Future deleterecord(String pid) async
      {
        var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/productdeleteapi.php"));
    request.fields.addAll({
      'id':pid,
    });
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

        Future saverec(var id,var name,var product1,var product2,var product3,var price,var discount,
        var sale,var category) async
      {
        var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/productupdateapi.php"));
   
        var pic=await http.MultipartFile.fromPath("photos1",product1);
        var pic2=await http.MultipartFile.fromPath("photos2",product2);
        var pic3=await http.MultipartFile.fromPath("photos3",product3);
        
      
        request.files.add(pic);
        request.files.add(pic2);
        request.files.add(pic3);
        request.fields['id']=id.toString();
        request.fields['name']=name.toString();
        request.fields['price']=price.toString();
        request.fields['discount']=discount.toString();
        request.fields['sale']=sale.toString();
        request.fields['category']=category.toString();
    
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
  
        Future saverec1(var sid,var name,var product1,var product2,var product3,var price,var discount,
        var sale,var s) async
      {print("kkk");
        print(sid);
        var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/productapi.php"));
        
        var pic=await http.MultipartFile.fromPath("photos1",product1);
        var pic2=await http.MultipartFile.fromPath("photos2",product2);
        var pic3=await http.MultipartFile.fromPath("photos3",product3);
        
        
        request.files.add(pic);
        request.files.add(pic2);
        request.files.add(pic3);
        request.fields['s_id']=sid;
        request.fields['name']=name;
        request.fields['price']=price;
        request.fields['discount']=discount;
        request.fields['sale']=sale;
        request.fields['category']=s.toString();
    request.fields['s_id']=sid;
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
  
}
	
