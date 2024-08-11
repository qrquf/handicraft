import 'dart:ui';

import 'package:http/http.dart';
import 'package:ecommerce/AAAAAA/xyz.dart';
import 'package:flutter/src/widgets/async.dart';
import '';
import 'package:flutter/material.dart';
import 'package:ecommerce/AAAAAA/httpservicesphotos.dart';
import 'package:ecommerce/AAAAAA/postmode.dart';
var did;



class Screen5 extends StatefulWidget
{
  Screen5({uid})
  {
    did=uid;

  }
  @override
  showpost createState() {
    return showpost();
  }
}
class showpost extends State<Screen5>{
   HttpServices httpservices =new HttpServices(uid:did);
   @override
   void initState() {
    super.initState();
   }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("flutter api app")),
      body:FutureBuilder<List<pictures>>
      (
      
        future: httpservices.getAllPost() ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<pictures>? picture = snapshot.data!;
            return ShowPostList(context,picture);
          }
          //}
        
        //else{
          return CircularProgressIndicator();
        //}
        }),

      )

        )
      
    ;
  }

}

ListView ShowPostList(BuildContext context, List<pictures> posts) {

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation:5,
          margin:EdgeInsets.all(10),
          child:Column(children:[
            Image.network(posts[index].url.toString()),
            
          ]),

        );
      },
    );

  }


