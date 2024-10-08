import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/Api/producthttp.dart';
import 'package:ecommerce/Api/sellerhttp.dart';
import 'package:ecommerce/Modal%20class/sellermodal1.dart';
import 'package:ecommerce/Modal%20class/sellmdal1.dart';

postApiHttp http=postApiHttp();
var ssid;
class Contact extends StatelessWidget {
  Contact({id})
  {print('SID');
    print(id);
ssid=id;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: FutureBuilder<List<sellmodal1>>
      (
      
        future: http.getAllPost1(ssid) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<sellmodal1>? picture = snapshot.data!;
            return ccy(context,picture);
          }
          //}
        
        //else{
          return CircularProgressIndicator();
        //}
        }),

      )

      ));
  }
  ccy(context,List<sellmodal1> posts)
  {
    return ContactUs(
          textColor: Colors.black,
          cardColor: Colors.white.withOpacity(0.4),
          companyColor: Colors.black,
          taglineColor: Colors.black,
          phoneNumberText:posts[0].number.toString(),
          emailText:posts[0].email.toString() ,
          websiteText:posts[0].email.toString(),
          logo: AssetImage('sculpture.jpeg'),
          email: posts[0].email.toString(),
          companyName: posts[0].business.toString(),
          phoneNumber: posts[0].number.toString(),
          
          dividerThickness: 2,
          website: 'https://abhishekdoshi.godaddysites.com',
          //githubUserName: 'SidSri777',
         // linkedinURL: 'https://www.linkedin.com/in/sid-sri-520983199/',
          tagLine: 'Small HandiCraft Worker ',
          twitterHandle: 'sidsri1221',
          //instagramUserName: '_abhishek_doshi',
        );
  }
}