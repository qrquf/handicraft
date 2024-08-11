import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Modal%20class/carthttp.dart';
import 'package:ecommerce/Modal%20class/cartmodal.dart';
import 'package:ecommerce/Modal%20class/producthttp.dart';
import 'package:ecommerce/Modal%20class/productmodal.dart';
var x;
httpServices14 http=new httpServices14();
class CartComponents extends StatefulWidget {
   CartComponents({uid})
  {
    x=uid;

  }
  @override
  _CartComponentsState1 createState() {
    return _CartComponentsState1();
  }
}
httpServices13 http2=httpServices13();
class _CartComponentsState1 extends State<CartComponents>
{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      FutureBuilder<List<prodModal>>
      (
      
        future: http2.getAllPost("") ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<prodModal>? picture = snapshot.data!;
            return ShowPostList(context,picture);
          }
          //}
        
        //else{
          return CircularProgressIndicator();
        //}
        }),

      )
      
    );
  }

}
ShowPostList(BuildContext context,List<prodModal> posts)
{//List xy=[];
  for(int i=0;i<posts.length-1;i++)
  {
    if(posts[i].id.toString()==x.toString())
    {
   return  SizedBox(
      height: 120,
      child: Card(
        shadowColor: Colors.blue,
        //surfaceTintColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.blueAccent
          )
        ),
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ListTile(
          //Product Image
          leading: Image(
            image: NetworkImage("http://handy.ludokingatm.com/fileupload/"+posts[i].product1.toString()),
            //height: 200,
            //width: 100,
            fit: BoxFit.contain,
          ),
          //Product name
          title: Text(
            posts[i].name.toString(),
            style: const TextStyle(fontSize: 20),
          ),

          subtitle: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              //Product Size and Color
              Row(
                children: [
                  SizedBox(width: 84,child: Text("Qty Available: ${posts[i].sale.toString()}",style: TextStyle(fontSize: 12),),),
                  const Spacer(),
                  SizedBox(width: 74,child: Text("Size : 120*120 cm",style: TextStyle(fontSize: 12),),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //Product Price
              Container(
                alignment: Alignment.topLeft,
                child: Text("₹${posts[i].price.toString()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
              )
            ],
          ),
          trailing: FittedBox(
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.add),),
                Text("${posts[i].price}"),
                IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.minus),),
              ],
            ),
          ),
        ),
      ),
    );
    
    }
  }
 //  return _CartComponentsState(dd:xy);
}

List v=[];
class _CartComponentsState extends State<CartComponents> {
  _CartComponentsState({dd})
  {
    v=dd;
  }
  var cartItems = [
    {
      "name": "Shoes",
      "image": "M_Footwear1.jpg",
      "price": 459,
      "size": "7",
      "color": "Green",
      "quantity": 1
    },
    {
      "name": "Dress",
      "image": "F_Dress1.jpg",
      "price": 599,
      "size": "M",
      "color": "Grey",
      "quantity": 1
    },
    {
      "name": "Blazer",
      "image": "M_Dress1.jpg",
      "price": 799,
      "size": "M",
      "color": "Black",
      "quantity": 1
    },
    {
      "name": "Wrist Watch",
      "image": "Watch1.jpg",
      "price": 14999,
      "size": "M",
      "color": "Black",
      "quantity": 1
    },
    {
      "name": "Headphone",
      "image": "Headphone1.jpg",
      "price": 1999,
      "size": "M",
      "color": "Blue",
      "quantity": 1
    },
    {
      "name": "Nokia Mobile",
      "image": "Phone1.jpg",
      "price": 4999,
      "size": "4.5 in",
      "color": "Red",
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return SingleCartItem(
            cart_prod_Name: cartItems[index]["name"],
            cart_prod_Image: cartItems[index]["image"],
            cart_prod_Price: cartItems[index]["price"],
            cart_prod_Size: cartItems[index]["size"],
            cart_prod_Color: cartItems[index]["color"],
            cart_prod_Qty: cartItems[index]["quantity"],
          );
        });
  }
}

class SingleCartItem extends StatelessWidget {
  final cart_prod_Name;
  final cart_prod_Image;
  final cart_prod_Price;
  final cart_prod_Size;
  final cart_prod_Color;
  final cart_prod_Qty;

  const SingleCartItem(
      {Key? key,
      this.cart_prod_Name,
      this.cart_prod_Image,
      this.cart_prod_Price,
      this.cart_prod_Size,
      this.cart_prod_Color,
      this.cart_prod_Qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        shadowColor: Colors.blue,
        //surfaceTintColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.blueAccent
          )
        ),
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ListTile(
          //Product Image
          leading: Image(
            image: AssetImage(cart_prod_Image,),
            //height: 200,
            //width: 100,
            fit: BoxFit.contain,
          ),
          //Product name
          title: Text(
            cart_prod_Name,
            style: const TextStyle(fontSize: 20),
          ),

          subtitle: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              //Product Size and Color
              Row(
                children: [
                  SizedBox(width: 84,child: Text("Color : $cart_prod_Color",style: TextStyle(fontSize: 12),),),
                  const Spacer(),
                  SizedBox(width: 74,child: Text("Size : $cart_prod_Size",style: TextStyle(fontSize: 12),),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //Product Price
              Container(
                alignment: Alignment.topLeft,
                child: Text("₹$cart_prod_Price",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
              )
            ],
          ),
          trailing: FittedBox(
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.add),),
                Text("$cart_prod_Qty"),
                IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.minus),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
