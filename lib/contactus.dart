import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Api/producthttp.dart';
import 'package:ecommerce/Api/sellerhttp.dart';
import 'package:ecommerce/Modal%20class/sellermodal1.dart';
import 'package:ecommerce/Modal%20class/sellmdal1.dart';


postApiHttp http=postApiHttp();
var ssid;
class Contact1 extends StatelessWidget {
  Contact1({id})
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
        body: Container(
          child:ccy(context),
          )
        )

      );
  }
  ccy(context)
  {
    return ContactUs(
          textColor: Colors.black,
          cardColor: Colors.white.withOpacity(0.4),
          companyColor: Colors.black,
          taglineColor: Colors.black,
          phoneNumberText:"give a call",
          emailText:'siddharthsrivastava117@gmail.com',
          websiteText:'handy.ludokingatm.com',
          logo: NetworkImage("data:image/png;base64,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"),
          email: "handyofficial@gmail.com",
          companyName: "handy enterprises",
          phoneNumber: "6392973667",
          
          dividerThickness: 2,
          website: 'https://abhishekdoshi.godaddysites.com',
          githubUserName: 'SidSri777',
          linkedinURL: 'https://www.linkedin.com/in/sid-sri-520983199/',
          tagLine: 'Small HandiCraft Worker ',
          twitterHandle: 'sidsri1221',
        
        );
  }
}