import 'package:http/http.dart';
import 'package:ecommerce/AAAAAA/usermodalclass.dart';
import 'dart:convert';
class HttpServices2
{final iiid;
   HttpServices2({
    this.iiid
  }) ;
  final String baseUrl="https://jsonplaceholder.typicode.com/users/?id=";

Future<List<users>> getAllPost() async{
  Response res=await get(Uri.parse(baseUrl+iiid.toString()));
  
  if(res.statusCode==200)
  {
    List<dynamic> data=jsonDecode(res.body);
    print(data[0]['price']);
    List<users> allPost=data.map((dynamic item)=>users.fromJson(item)).toList();
    return allPost;

  }
  else{
    throw "Something went wrong";
  }
}  

}