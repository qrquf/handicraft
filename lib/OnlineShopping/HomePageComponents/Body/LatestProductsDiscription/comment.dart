import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Api/carthttp.dart';
import 'package:ecommerce/Modal%20class/feedbackmodal.dart';
import 'package:ecommerce/Api/feedhttp.dart';
import 'package:ecommerce/Notification.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Cart/Cart.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Profile%20Page/ProfilePage.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/prod12.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
httpfeed http=httpfeed();
var id1,id2;
class Commentx extends StatefulWidget
{
  Commentx({x,y})
  {
id1=x;
id2=y;
  }
 @override
 Comment1 createState()
 {
  return Comment1();
 } 
}
class Comment1 extends State<Commentx>
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text("Comments"),
    ),
    body:FutureBuilder<List<feedmodal>>
      (
      
        future: http.getAllPost2(id1,id2) ,
        builder: ((context, snapshot) {
          
          if(snapshot.hasData)
          {
            List<feedmodal>? picture = snapshot.data!;
            return xxy(context,picture);
          }
          //}
        
        else{
          return CircularProgressIndicator();
        }
  }),

      )
   ) ;
  }
  xxy(BuildContext context,List<feedmodal> posts)

  {
return ListView.builder(
  scrollDirection: Axis.vertical,
  addAutomaticKeepAlives: true,
  shrinkWrap: true,

  itemCount: posts.length,
  itemBuilder: (context, index) {
    
  return Padding(padding: EdgeInsets.all(10),child:SizedBox(height:40,width:500,child:Card(
    elevation: 20,
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
child:Text(posts[index].comment.toString())
  )));}
);
  }
} 