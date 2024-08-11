import 'package:ecommerce/AAAAAA/new2.dart';
import 'package:ecommerce/AAAAAA/prog.dart';
import 'package:ecommerce/AAAAAA/user.dart';
import 'package:ecommerce/Modal%20class/subg.dart';
import 'package:ecommerce/Modal%20class/subghttp.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
import 'package:ecommerce/OnlineShopping/WelcomeScreen.dart';
import 'package:ecommerce/OnlineShopping/localstorage.dart';
import 'package:ecommerce/Seller/AddProduct.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
import 'package:ecommerce/footer.dart';
import 'package:ecommerce/logo.dart';
import 'package:ecommerce/AAAAAA/new.dart';
import 'package:ecommerce/payment.dart';
import 'package:flutter/material.dart';
//import 'package:ecommerce/new2.dart';
httpServices21 htp=httpServices21();
var idd;
class subs extends StatefulWidget
{
  subs({id
  })
  {
idd=id;
  }
@override
sub1 createState()
{
  return sub1();
}
}
class sub1 extends State<subs>
{
  @override
  Widget build(BuildContext context) {
return (
  Scaffold(
    appBar: AppBar(
      title:Text("Your Subscription Status")
    ),
    body:
    FutureBuilder<List<subg>>
      (
      
        future: htp.getAllPost(idd) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<subg>? picture = snapshot.data!;
            return yyy(context,picture);
          }
          //}
        
        else{
          return CircularProgressIndicator();
        }
        }),

      )
  )
);
  }
  yyy(BuildContext context,List<subg> posts)
  {int b=0;
  String c="";
  String d="";
    String a="";
    if(posts[0].subsValue==null)
    {b=2;
    c="Basic";
    d="Unlimited";
      a="https://img.freepik.com/free-vector/award-ribbon_24908-54753.jpg?size=338&ext=jpg&ga=GA1.2.1546985788.1678723271&semt=ais";
    }
    else if(posts[0].subsValue.toString()==2.toString())
    {b=5;
    c=posts[0].planName.toString();
    d=posts[0].expiryDate.toString();
      a="https://img.freepik.com/free-vector/shield_24908-54460.jpg?size=338&ext=jpg&ga=GA1.2.1546985788.1678723271&semt=ais";
    }
    else if(posts[0].subsValue.toString()==3.toString())
    {b=10;
     c=posts[0].planName.toString();
    d=posts[0].expiryDate.toString();
      a="https://w7.pngwing.com/pngs/670/628/png-transparent-golden-shield-badge-golden-shield-badge-thumbnail.png";
    }
    return Padding(
      padding:EdgeInsets.all(20),
      child:Column(
      children:[
        Center(
          
          child:
          SizedBox(height:200,width:200,
          child:CircleAvatar(
            
            backgroundImage: NetworkImage(a),
          )
        )),
        SizedBox(height:1),
        Expanded(
          child:Text("your current plan is "+c)
        ),
        SizedBox(height:1),
        Expanded(
          child:Text("your expiry date of plan is "+d)
        ),
        SizedBox(height:1),
        Expanded(
          child:Text("total no of adds you can post is "+b.toString())
        ),
        
      ])
    );
  }

}