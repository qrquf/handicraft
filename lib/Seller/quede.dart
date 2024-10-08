import 'package:flutter/material.dart';
import 'package:ecommerce/Api/producthttp.dart';
import 'package:ecommerce/Modal%20class/productmodal.dart';
import 'package:ecommerce/Api/sellerhttp.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/HamburgerMenu.dart';
import 'package:ecommerce/Seller/AddProduct.dart';
import 'package:ecommerce/Seller/prodDetails.dart';
import 'package:ecommerce/Seller/proddetails1.dart';
httpServices13 http=httpServices13();
var sid;
class Qued1 extends StatefulWidget{
  Qued1({
    dd
  })
  {sid=dd;
  }
  @override
  Qued createState()
  {
    return Qued();
  }
}
class Qued extends State<Qued1>
{

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home:Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () {Navigator.pop(context);},
      icon: Icon(Icons.arrow_back,)),
      title:Text("Ready to be added Product",style:TextStyle(color:Colors.grey,fontSize: 16.0,fontStyle: FontStyle.italic)),
      actions:[
        Center(
          child:Text(DateTime.now().toString()),
         
        ),
        
        
      ]
    ),
    //drawer: HamburgerMenu(),
    body:FutureBuilder<List<prodModal>>
      (
      
        future: http.getAllPost3(sid) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          switch(snapshot.connectionState)
          {case ConnectionState.none:
          return CircularProgressIndicator();

          case ConnectionState.waiting:
          return CircularProgressIndicator();
          
            case ConnectionState.active:
          return give(context,snapshot.data!);
          case ConnectionState.done:
          return give(context,snapshot.data!);
          
        
        //else{
          return CircularProgressIndicator();
        //}
        }}),

      )


    )
   );
  }
give(BuildContext context,List<prodModal> posts)
{
  return ListView.builder(itemCount: posts.length,
          shrinkWrap: true,
          addRepaintBoundaries: true,
          
            itemBuilder:((context, index) {
              return Padding
    (padding: EdgeInsets.all(10.0),
    child:SingleChildScrollView(
      
      physics: const BouncingScrollPhysics(),
      child:Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
            
          InkWell(child:Card(elevation: 20,child: ListTile(
            leading: Image.network("http://handy.ludokingatm.com/fileupload/"+posts[index].product1.toString(),width: 100,height: 100,fit: BoxFit.cover,),
            title: Text("product title",style:TextStyle(color: Color.fromARGB(255, 48, 46, 46),fontWeight: FontWeight.bold)),
            subtitle: Text(" ₹ ${posts[index].discount.toString()}",style: TextStyle(color:Color.fromARGB(255, 158, 150, 150)),

            ),
            trailing:PopupMenuButton<int>(onSelected:(item)=>handleClick(item),itemBuilder:(context)=> [
            PopupMenuItem<int>(value:1,child: ElevatedButton(child:Text("remove it"),onPressed: () {
            http.deleterecord(posts[index].id.toString());
            setState(() {
                 
                  });

            })),
            ],

            icon:Icon(Icons.more_vert_rounded) ,),
          )
      ),
      onTap: () {Navigator.push(
                            context,
                             MaterialPageRoute(
                               builder: (context) =>  addproduct12(
                               id :posts[index].id,
                                name:posts[index].name.toString(),
                               product1:posts[index].product1.toString(),
                               product2: posts[index].product2.toString(),
                               product3: posts[index].product3.toString(),
                               price: posts[index].price,
                               discount: posts[index].discount,
                               sale: posts[index].sale,
                               ),
                             ),
                         );},
      )])));
}
)
  );
    
}
}
void handleClick(int item)
{
  switch(item)
  {
    case 0:
    break;
    case 1:
    break;
  }
}