import 'package:flutter/material.dart';
import 'package:ecommerce/AAAAAA/httpservicesphotos.dart';
import 'package:ecommerce/AAAAAA/httpservicesposts.dart';
import 'package:ecommerce/AAAAAA/postmode.dart';
import 'package:ecommerce/AAAAAA/user.dart';


class screen1 extends StatefulWidget
{
  @override
  showpost createState() {
    return showpost();
  }
}
class showpost extends State<screen1>{
   httpServices1 httpservices =new httpServices1();
   @override
   void initState() {
    super.initState();
   }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("flutter api app")),
      body:FutureBuilder<List<postmode>>
      (
      
        future: httpservices.getAllPost() ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
            List<postmode> postModelList = snapshot.data!;
            return ShowPostList(context,postModelList);

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

ListView ShowPostList(BuildContext context, List<postmode> posts) {

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return InkWell(onTap: () {
          Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>screen15(uid: posts[index].userId.toString()) ),
                             
                           );
        
        },child: Card(
          
          elevation:5,
          margin:EdgeInsets.all(10),
          child:Column(children:[
            Text("User Id"+posts[index].userId.toString()),
            Text("id"+posts[index].id.toString()),
            Text("title"+posts[index].title.toString()),
            Text("body"+posts[index].body.toString()),
            
          ]),

        ));
      },
    );

  }


