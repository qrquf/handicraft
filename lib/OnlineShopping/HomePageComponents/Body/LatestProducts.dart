//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ecommerce/Api/feedhttp.dart';
import 'package:ecommerce/Api/producthttp.dart';
import 'package:ecommerce/Modal%20class/productmodal.dart';
import 'package:ecommerce/Api/userhttp.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/LatestProductsDiscription/LatestProductDescription.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
 httpServices13 http=httpServices13();
  var xy;
  var prod1;
  var prod12="Wall Painting";
    List<prodModal>? picture;
class LatestProducts extends StatefulWidget {
   LatestProducts({super.key,idd,prod})
  {
  
    prod1=prod;
    
print(prod1);

    print("shubh");
    print(xy);
    xy=idd;
    print(xy);
  }

  @override
  LatestProductsState createState() => LatestProductsState();

  
          
  

  }
 


class LatestProductsState extends State<LatestProducts> {
 ShowPostList(BuildContext context, List<prodModal> posts)  {


    return Column(
      
      mainAxisAlignment:MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
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
final phd=posts[index].id;
final idi=xy;
  print("hero");
            var post2=posts[index].discount;
            var prodOldPrice=posts[index].price;
            var prodImage="http://handy.ludokingatm.com/fileupload/"+posts[index].product1.toString();
            return  Card(
      child: Hero(
        tag: "http://handy.ludokingatm.com/fileupload/"+posts[index].product1.toString(),
        child: Material(
          child: InkWell(
            onTap: () async {

              print("ooye");
              print(idi);
              print(posts[index].id);

                httpfeed hgp=httpfeed();
                int j=await hgp.feedSelect(idi, posts[index].id.toString());
                if(j==1)
                {
                await hgp.SaveRecord2(xy.toString(),posts[index].id.toString());
                }

              Navigator.of(context).push(
               

                MaterialPageRoute(

                  builder: (context) =>
                  
                SizedBox(child:       
                  LatestProductsDescription(
                    name:"",
                     x: posts[index].name.toString(),
                    y: "http://handy.ludokingatm.com/fileupload/"+posts[index].product1.toString(),
                    z: posts[index].price.toString(),
                    w: posts[index].discount.toString(),
                    category:posts[index].category.toString(),
                    id:idi,
                    pid:posts[index].id.toString()

                   
                  ),
              ),
              ));
            },
            child: GridTile(
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
            );
          }
             
            )]);
  }



 
 
   var v;

   var v2;
var v3;
var v4;
   
      
 //var w=[{"name":v1[1].name,"image":v1[1].product1,"old_price":v1[1].price,"price":v1[1].discount}];
   
  
  
  var productList = [
    {
      "name": "polyester gold and black buddha ",
      "image": "https://images.pexels.com/photos/186846/pexels-photo-186846.jpeg?auto=compress&cs=tinysrgb&w=600",
      "old_price": 999,
      "price": 459,
    },
    {
      "name": "Wronght iron ganesh ji",
      "image": "https://images.pexels.com/photos/186846/pexels-photo-186846.jpeg?auto=compress&cs=tinysrgb&w=600",
      "old_price": 1199,
      "price": 599,
    },
    {
      "name": "orange and purple iron lord",
      "image": "https://images.pexels.com/photos/186846/pexels-photo-186846.jpeg?auto=compress&cs=tinysrgb&w=600",
      "old_price": 1399,
      "price": 799,
    },
    {
      "name": "golden brass ganesha wall",
      "image": "https://images.pexels.com/photos/186846/pexels-photo-186846.jpeg?auto=compress&cs=tinysrgb&w=600",
      "old_price": 29999,
      "price": 14999,
    },
    {
      "name": "digital woman art",
      "image": "https://images.pexels.com/photos/186846/pexels-photo-186846.jpeg?auto=compress&cs=tinysrgb&w=600",
      "old_price": 4999,
      "price": 1999,
    },
    {
      "name": "xyz",
      "image": "https://images.pexels.com/photos/186846/pexels-photo-186846.jpeg?auto=compress&cs=tinysrgb&w=600",
      "old_price": 7999,
      "price": 4999,
    },
  ];
  
Widget build(BuildContext context) {
  
    return 
      //appBar: AppBar(title:Text("flutter api app")),
    
          
      FutureBuilder<List<prodModal>>  
      (
      
        future: http.getAllPost(key),
        builder: ((context, snapshot) {
       print("calm down");
       print(key);  
        switch(snapshot.connectionState)
        {  
          case ConnectionState.none:
         
            return CircularProgressIndicator();
          case ConnectionState.waiting:
          return CircularProgressIndicator();
        
        
          case ConnectionState.active:
           return ShowPostList(context,snapshot.data!);
          
         case ConnectionState.done:
         //return CircularProgressIndicator();
           return ShowPostList(context,snapshot.data!);
          
        } 
          //}
        
        //else{
          //return CircularProgressIndicator();
        //}
        
        
        //  return CircularProgressIndicator();
        }),

      )
            
    

    
      
    ;
}

}

class Products extends StatelessWidget {
  final prodName;
  final prodImage;
  final prodOldPrice;
  final prodPrice;

  const Products({
    
    super.key,
    this.prodName,
    this.prodImage,
    this.prodOldPrice,
    this.prodPrice,
  });
  

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(child:Card(
      child: Hero(
        tag: prodImage,
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LatestProductsDescription(
                    name:"",
                    id:"",
                    pid:"",
                     x:"hfdf",
                    y: "fbgxb",
                    z: "dfbdg",
                    w:"dfdbdg",
                    category:""
                 
                  ),
                ),
              );
            },
            child: GridTile(
              footer: Container(
                height: 56,                
                color: Colors.white24,
                child: ListTile(
                  leading: Text(
                    prodName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).devicePixelRatio*0.5,
                    ),
                  ),
                  title: Text(
                    "₹$prodPrice",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontSize: MediaQuery.of(context).devicePixelRatio*0.8,
                    ),
                  ),
                  subtitle: Text(
                    "₹$prodOldPrice",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.black54,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              child: Image.network(
                prodImage,
                fit: BoxFit.fill,
              ),
            
            ),
          ),
        ),
      ),
           ));
  }
  
}
