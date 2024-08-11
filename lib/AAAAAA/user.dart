import 'package:flutter/material.dart';
import 'package:ecommerce/AAAAAA/httpservicesphotos.dart';
import 'package:ecommerce/AAAAAA/httpservicesposts.dart';
import 'package:ecommerce/AAAAAA/httpservicesusers.dart';
import 'package:ecommerce/AAAAAA/postmode.dart';
import 'package:ecommerce/AAAAAA/usermodalclass.dart';
import 'package:ecommerce/AAAAAA/xyz.dart';

dynamic pid;
 
class screen15 extends StatefulWidget
{
  
   screen15({
  uid}
  )

  {
pid=uid;
  }
  

  @override
  showpost createState() {
    return showpost(iid: pid.toString());
  }
}
String? iid;
class showpost extends State<screen15>{

showpost({iid});
   final HttpServices2 httpservices =HttpServices2(iiid:pid);
   @override
   void initState() {
    super.initState();
   }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("flutter api app")),
      body:Column(
        
        
        children:[
          Text("user details"),
          Expanded(child:xyz()),
          Expanded(child:mno()),
          Expanded(child:pqr()),
        ]))
      
    ;

  }
   xyz()
  {
    return  FutureBuilder<List<users>>
      (
      
        future: httpservices.getAllPost() ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
            List<users> postModelList = snapshot.data!;
            return ShowPostList(context,postModelList);

          //}
        
        //else{
          //return CircularProgressIndicator();
        //}
        }),

      );
  }

}
ListView ShowPostList1(BuildContext context, List<pictures> posts) {

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




ListView ShowPostList(BuildContext context,  posts) {

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation:5,
          margin:EdgeInsets.all(10),
          child:Column(children:[
            Text("User Id"+posts[index].address!.street.toString()),
            Text("id"+posts[index].id.toString()),
            Text("title"+posts[index].email.toString()),
            Text("body"+posts[index].phone.toString()),
            
          ]),

        );
      },
    );
    

  }
   mno()
  {HttpServices httpservices =HttpServices(uid:pid);
    return  FutureBuilder<List<pictures>>
      (
       
        future: httpservices.getAllPost() ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
            List<pictures> postModelList = snapshot.data!;
            return ShowPostList1(context,postModelList);

          //}
        
        //else{
          //return CircularProgressIndicator();
        //}
        }),

      );
  }
   pqr()
  {httpServices1 httpservices =httpServices1(dd1:pid);
    return  FutureBuilder<List<postmode>>
      (
      
        future: httpservices.getAllPost() ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
            List<postmode> postModelList = snapshot.data!;
            return ShowPostList2(context,postModelList);

          //}
        
        //else{
          //return CircularProgressIndicator();
        //}
        }),

      );
  }
  ListView ShowPostList2(BuildContext context, List<postmode> posts) {

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
