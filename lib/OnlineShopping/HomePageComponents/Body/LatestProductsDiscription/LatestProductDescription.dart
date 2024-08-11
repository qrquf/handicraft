

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Checkout.dart';
import 'package:ecommerce/Modal%20class/carthttp.dart';
import 'package:ecommerce/Modal%20class/feedbackmodal.dart';
import 'package:ecommerce/Modal%20class/feedhttp.dart';
import 'package:ecommerce/Notification.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Cart/Cart.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Profile%20Page/ProfilePage.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/LatestProductsDiscription/comment.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/prod12.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';

import '../LatestProducts.dart';
var a;
var b;
var c;
var q;
var category1;
var id1;
var id2;
httpfeed http=httpfeed();

class LatestProductsDescription extends StatefulWidget {
 // final  prodDescriptionName;
  //final prodDescriptionImage;
  //final prodDescriptionOldPrice;
  //final prodDescriptionNewPrice;
  //final x=Icons.favorite_border;
 
   LatestProductsDescription(
      {x,y,z,w,category,name,id,pid
      //this.prodDescriptionName,
      //this.prodDescriptionImage,
     //this. prodDescriptionOldPrice,
      //this.prodDescriptionNewPrice

      })
      {id1=id;
      id2=pid;
      print("huduk");
      print(id);
      print(id2);

        category1=category;
        a=x;
        b=y;
        c=z;
        q=w;
        print(d);
        print(c);
       // print(this.prodDescriptionName);
      }
  
      

  @override
  _LatestProductsDescriptionState createState() {
      return _LatestProductsDescriptionState();
}}

class _LatestProductsDescriptionState extends State<LatestProductsDescription> {
 var likes="0";
 var rating="0";
var comment="1";
TextEditingController com=TextEditingController();
   var d=Colors.lime;
  var x=Icons.favorite_border;
  var y=[Colors.grey,Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 100,
        elevation: 0,
        title: const Text("Online Shopping"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
            icon: const Icon(Icons.add_shopping_cart_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
        bottom: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            width: double.infinity,
            height: 40,
            color: Colors.white,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
      body:FutureBuilder<List<feedmodal>>
      (
      
        future: http.getAllPost1(id1,id2) ,
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

      ));
          }
          xxy(context,List<feedmodal> posts)
          {
            int j=0;
            for(int i=0;i<posts.length;i++)
            {print("yaad");
              print(id2);
              print(posts[i].pId);

              if(posts[i].pId.toString()==id2)
              {
                j=1;
                print("yaad");
                
                likes=posts[i].likes.toString();
                comment=posts[i].comment.toString();
                rating=posts[i].rating.toString();
                print(likes);
              }
            }
            if(likes!="0")
            {
              x=Icons.favorite;
              d=Colors.pink;
            }
            
            if(rating!="0")
            {
              for(int i=0;i<=int.parse(rating)-1;i++)
              {
                y[i]=Colors.yellow;

              }

            }

            
     return ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  color: Colors.white,
                  child: Image.network(b)),
              // const SizedBox(
              //   height: 10,
              // ),
              ListTile(
                leading: Text(
                  a,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  "${q}",
                  textAlign: TextAlign.right,
                ),
                subtitle: Text(
                  "${c}",
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //Product Description
              Row(
                children: [
                  //Size
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Size"),
                              content: const Text("Choose the size"),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  textColor: Colors.blue,
                                  child: const Text("Close"),
                                )
                              ],
                            );
                          },
                        );
                      },
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.2,
                      child: Row(
                        children: const [
                          Expanded(child: Text("Size")),
                          Expanded(child: Icon(Icons.arrow_drop_down)),
                        ],
                      ),
                    ),
                  ),

                  //Color
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Color"),
                              content: const Text("Choose the color"),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  textColor: Colors.blue,
                                  child: const Text("Close"),
                                )
                              ],
                            );
                          },
                        );
                      },
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.2,
                      child: Row(
                        children: const [
                          Expanded(child: Text("Color")),
                          Expanded(child: Icon(Icons.arrow_drop_down)),
                        ],
                      ),
                    ),
                  ),

                  //Quantity
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Quantity"),
                              content: const Text("Choose the quantity"),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  textColor: Colors.blue,
                                  child: const Text("Close"),
                                )
                              ],
                            );
                          },
                        );
                      },
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.2,
                      child: Row(
                        children: const [
                          Expanded(child: Text("Qty")),
                          Expanded(child: Icon(Icons.arrow_drop_down)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //Buy, Add to Cart and favourite button
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MaterialButton(
                        onPressed: () {Navigator.pushReplacement(
                            context,
                             MaterialPageRoute(
                               builder: (context) =>  Contact(id:id2.toString()),
                             ),
                         );},

                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: const Text("Contact Seller")),
                  ),
                  
                  IconButton(
                    onPressed: ()async {
                      
                      httpServices14 t= httpServices14(pid: id2,uid: id1);
                      int j=await t.insertcart1(id1,id2);
                      if(j==0)
                      {
                         await t.insertcart(id1,id2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Cart(emp: em),
                        ),
                      );
                    }
                    else
                    {
                       showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Product already exist"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},))));
                    }},
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: ()=> setState(() {
                      
                      if(d==Colors.pink)
                      {
                        d=Colors.lime;

                        likes="0";
                         http.feedupdate(posts[0].uId.toString(), id2.toString(), comment.toString(), likes.toString(),
                         rating.toString());
                         
                      }
                      else
                      {
                        likes="1";
                        http.feedupdate(posts[0].uId.toString(), id2.toString(), comment.toString(), likes.toString(),
                         rating.toString());
                         
                        d=Colors.pink;
                      }

                    ;}) ,
                    icon: Icon(
                      x,
                      color: d,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.grey.shade400,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 10,
              ),

              //Product Specification Header
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Product Specifications",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //Product Specifications Details
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    //Product Name
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        
                        SizedBox(height:10),
                        const Text(
                          "Product Name",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          "${a}",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Product Brand
                    Row(
                      children:  [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Product Category",
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          category1.toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Product Condition
                    Row(
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Product Condition",
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                        SizedBox(
                          width: 68,
                        ),
                        Text(
                          "New",
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              
              Center(
              child:Text("Rate this Product",style: TextStyle(fontSize:20,),),),
const SizedBox(
                height: 8,
              ),
              
              Center(child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                 children:[
                                             for(int i=0;i<5;i++) IconButton(onPressed: ()=> setState(() {
                              http.feedupdate(posts[0].uId.toString(), id2.toString(), comment.toString(), likes.toString(),
                         (i+1).toString());
                         
                              
                              for(int j=i;j>=0;j--)
                              {int p=5;
                              int g=0;
                                y[j]=Colors.yellow;
                      
                            }
                            for(int k=i+1;k<5;k++)
                            {
                              y[k]=Colors.grey;
                            }
                              
                            ;}
                            ), icon: Icon(Icons.star,color:y[i]))
           ]
                        )),
                        const SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(height:20),

               Container(
            color:Colors.white,
          child:TextField(
            
            controller: com,
            //minLines: 5,
            keyboardType: TextInputType.multiline,
         minLines: 5,
         maxLines: 10,
         
            decoration: InputDecoration(
              labelText: "Add your Review",
              fillColor: Colors.white
              
              
            )),

          ),  

        //  Chip(label: Text("view Comments"),,),
           SizedBox(height:20),
           Align(child:ElevatedButton(onPressed: () {
comment=com.text.toString();
            http.feedupdate(posts[0].uId.toString(), id2.toString(), comment.toString(), likes, rating);
            
           },child: Text("post"),)),
          SizedBox(height:20),

            
              TextButton(child:Text("view Comments"),onPressed:() {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Commentx(x:id1,y:id2),
                          ),
                        );
              }),  //Similar Products Headers
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Similar Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //Similar Products Images
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child:  LatestProducts(),
              )
            ],
          )
        ],
      );

          }        }
