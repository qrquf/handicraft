import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


import 'package:ecommerce/Modal%20class/subgmodal.dart';
import 'package:ecommerce/Modal%20class/updatemodal.dart';
var dd;
class   httpServices21 {

  final String baseUrl = "http://handy.ludokingatm.com/sellsubapi.php/?s_id=";

  Future<List<subg>> getAllPost(var x) async {
    Response res = await get(Uri.parse(baseUrl+x.toString()));
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      List<subg> allPost =
          data.map((dynamic item) => subg.fromJson(item)).toList();
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
  Future insert(var rad,var seller_id,var start_date,var exp_date,var Plan_name,var sub_value) async
  {
 var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/subsinsertapi.php"));
request.fields['Seller_id']=seller_id.toString();
request.fields['Subscription_id']=rad.toString();
request.fields['Start_date']=start_date.toString();
request.fields['Expiry_date']=exp_date.toString();
request.fields['Plan_name']=Plan_name.toString();
request.fields['subs_value']=sub_value.toString();

 
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
  Future<int> del(var email,var date) async
  {
    //final String baseUrl1 = "http://handy.ludokingatm.com/delupdate.php";\
     var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/dis.php"));
     request.fields['email']=email;
request.fields['date']=date.toString();
String s='''"success"''';
 http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q=await response.stream.bytesToString();
      print(q);
      String f="";
      
      if(q.toString()!='null' && q!="")
      {print("ss");
        if(q=='''""''')
      {
        return -1;
      }
        for(int i=0;i<q.length;i++)
      {
      if(q[i]!='''"''')
      {
        f=f+q[i];
      }
      }
        print("aabra ka dabra");
        return int.parse(f);

      }
      else
      {
        print("bhaq");
        return -1;
      }
      
    }
    else{
      return -1;

  }
}

  Future<int> del1(var date) async
  {
    //final String baseUrl1 = "http://handy.ludokingatm.com/delupdate.php";\
     var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/delupdate.php"));
request.fields['date']=date.toString();
String s='''"success"''';
 http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q=await response.stream.bytesToString();
      print(q);
      if(q==s)
      {print("aabra ka dabra");
        return 1;

      }
      else
      {
        print("bhaq");
        return 0;
      }
      
    }
    else{
      return 0;

  }
}

  Future<int> vali(var date) async
  {
    //final String baseUrl1 = "http://handy.ludokingatm.com/delupdate.php";\
     var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/vali.php"));
request.fields['email']=date.toString();
String s='''"success"''';
 http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q=await response.stream.bytesToString();
      print(q);
      if(q==s)
      {
        return 1;

      }
      else
      {
        
        return 0;
      }
      
    }
    else{
      return 0;

  }
}

 Future<List<updatemodal>> getAllPost1(var x,var y) async {
  print(x);
  print(y);
    Response res = await get(Uri.parse("http://handy.ludokingatm.com/disshow.php/?date="+y.toString()));
    
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      List<updatemodal> allPost =
          data.map((dynamic item) => updatemodal.fromJson(item)).toList();
          print("poor");
          print(allPost[0].category.toString());
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }
}	
