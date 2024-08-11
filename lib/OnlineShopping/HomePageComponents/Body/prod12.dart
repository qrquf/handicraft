
import 'package:flutter/material.dart';
import 'package:ecommerce/Modal%20class/producthttp.dart';
import 'package:ecommerce/Modal%20class/productmodal.dart';
import 'package:ecommerce/Modal%20class/userhttp.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/LatestProductsDiscription/LatestProductDescription.dart';
var prod1,uid;
class cate extends StatefulWidget {
   cate({super.key,idd,prod})
  {uid=idd;
  
    prod1=prod;
    
print(prod1);

    print("shubh");
 //   xy=idd;
   // print(xy);
  }

  @override
  Cate1 createState() => Cate1();       
  }
  httpServices13 htp=httpServices13();
 class Cate1 extends State<cate>{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title:Text(prod1.toString()),
      leading:IconButton(icon:Icon(Icons.arrow_back),onPressed: () {Navigator.pop(context);},)
    ),
    body:     
      FutureBuilder<List<prodModal>>  
      (
      
        future: htp.getAllPost1(prod1),
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
         // {
          
          
            List<prodModal> picture = snapshot.data!;
            return ShowPostList(context,picture);
          
          //}
        
        //else{
          //return CircularProgressIndicator();
        //}
        //}else
        //{
          //return CircularProgressIndicator();
        //}
        }),

      )
       
   );
  }
 ShowPostList(BuildContext context, List<prodModal> posts)  {

    return  
      GridView.builder(
    
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          addRepaintBoundaries: true,
          itemCount: posts.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            ),
          itemBuilder: (BuildContext context, int index) {
            //print(posts[index].id);
    
       
             var post2=posts[index].discount;
            var prodOldPrice=posts[index].price;
            var prodImage="http://handy.ludokingatm.com/fileupload/"+posts[index].product1.toString();
            return SizedBox(height:400,width:400,child: Card(
      child: Hero(
        tag: "http://handy.ludokingatm.com/fileupload/"+posts[index].product1.toString(),
        child: Material(
          child: InkWell(
            onTap: () {
               
              Navigator.of(context).push(
                MaterialPageRoute(

                  builder: (context) =>
                  
                SizedBox(child:       
                  LatestProductsDescription(
                     x: posts[index].name.toString(),
                    y: "http://handy.ludokingatm.com/fileupload/"+posts[index].product1.toString(),
                    z: posts[index].price.toString(),
                    w: posts[index].discount.toString(),
                    category:posts[index].category.toString(),
                    id:uid,
                    pid:posts[index].id.toString()

                   
                  ),
              ),
              ));
            },
            child: SizedBox(height:300,width:300,child:GridTile(
              footer: Container(
                height: 56,
                //width:60,                
                color: Colors.white24,
                child: ListTile(
                  leading: Text(
                    posts[index].name.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  title: Text(
                    "₹$post2",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontSize: 8,
                    ),
                  ),
                  subtitle: Text(
                    "₹$prodOldPrice",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.black54,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 6,
                    ),
                  ),
                ),
              ),
              child: Image.network(
                prodImage,
                fit: BoxFit.cover,
              ),
            
            ),
          ),
        ),
      ),
            )));
 }
 
 
 );
 }
 }