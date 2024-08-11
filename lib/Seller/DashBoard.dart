
//import'package:intl/date_symbol_data_custom.dart' as intl;
import 'package:flutter/material.dart';
//import 'package:ecommerce/Modal%20class/producthttp.dart';
import 'package:ecommerce/Modal%20class/sellerhttp.dart';
import 'package:ecommerce/Modal%20class/sellermodal1.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/HamburgerMenu.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/LatestProducts.dart';
import 'package:ecommerce/Seller/AddProduct.dart';
import 'package:ecommerce/Seller/DashComponent.dart';
import 'package:ecommerce/Seller/MyOrders.dart';
import 'package:ecommerce/Seller/Seller_Subcription.dart';
import 'package:ecommerce/Seller/quede.dart';
import 'package:ecommerce/Seller/viewsubs.dart';
import 'package:ecommerce/invoice.dart';
postApiHttp http=postApiHttp();
var email;
var stand=5;
var pre=10;
class Dashboard extends StatelessWidget
{Dashboard({em})
{
  email=em;

}

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:AppBar(
      title:Text("DashBoard",style:TextStyle(color:Colors.grey,fontSize: 16.0,fontStyle: FontStyle.italic)),
      actions:[
        Center(
          child:Text(DateTime.now().toString()),
         
        ),
        
      ]
    ),
    drawer: HamburgerMenu(),
    body: FutureBuilder<List<sellmode>>
      (
      
        future: http.getAllPost(email) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<sellmode>? picture = snapshot.data!;
            return ccv(context,picture);
          }
          //}
        
        else{
          return CircularProgressIndicator();
        //}
        }}

      

)));
  }
  ccv(BuildContext context,List<sellmode> posts)
  {print("hang");
    //print(posts[0].id.toString());
    return 
     Padding(
      padding:const EdgeInsets.all(8.0),
      child:SingleChildScrollView(child:Column(
        children:[
          Row(
            children:[
              InkWell(child:
          dashBoardButton(context,title: "Subscription Status",count:"",icon1: Icons.edit),onTap:() {
             Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => subs(id:posts[0].id.toString()),
                            ),
                          );
          }),
          SizedBox(width:40),
          InkWell(
          child:dashBoardButton(context,title: "Add Products",count:"",icon1:Icons.queue),
          onTap:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => addproduct1(posts[0].id.toString()),
                            ),
                          );}
          )
            ]),
            
            SizedBox(height:10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
      InkWell( onTap: () {
         {Navigator.pushReplacement(
                            context,
                             MaterialPageRoute(
                               builder: (context) => HandySubscription(posts[0].id.toString()
                               ),
                             ),
                         );
                        // await GoogleSignInSignUpMethod().signInWithGoogle();
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const OnlineShopping(),
                        //   ),
                        // );
                      }
      },  child:dashBoardButton(context,title:"Buy Subscription",count: "",icon1: Icons.list),),
          SizedBox(width:40),
          InkWell(
            child:
          dashBoardButton(context,title: " all products",count: "15",icon1:Icons.production_quantity_limits),
          onTap:()  {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Qued1(dd: posts[0].id),
                            ),
                          );},
      )]),
 SizedBox(height:10),
      
 Text("Popular Product by you",style:TextStyle(fontSize:16.0,color:Colors.green)),
 SizedBox(height:10),
 LatestProducts(),

            
        ]
      )
    ),
   );
}

}