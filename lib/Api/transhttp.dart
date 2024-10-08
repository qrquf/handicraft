import 'dart:convert';
import 'package:http/http.dart';


import 'package:http/http.dart' as http;
class   httpServices20 {

  final String baseUrl = "http://handy.ludokingatm.com/paymentinsertapi.php";
Future Savereceipt(var s_id,var t_id,var dat,var amm) async
{
 var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
request.fields['subscription_id']=s_id.toString();
 request.fields['transaction_id']=t_id.toString();
 request.fields['payment_date']=dat.toString();
 request.fields['bank_id']=(1).toString();
 request.fields['amount']=amm.toString();
 

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
Future otp(var number,var otp) async
{
 var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/smm/index.php"));

request.fields['email']=number.toString();
request.fields['subject']=otp.toString();
request.fields['msg']="enter otp";
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
Future changepass(var email,var pass) async
{
 var request = http.MultipartRequest('POST', Uri.parse("http://handy.ludokingatm.com/forgetpass.php"));

request.fields['email']=email.toString();
request.fields['password']=pass.toString();
//request.fields['msg']="enter otp";
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
	
