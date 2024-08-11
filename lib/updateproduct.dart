import 'package:flutter/material.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
 var value5=false;
 class Product extends StatefulWidget
{  @override
  State<Product> createState() => UpdateProduct();
}

class UpdateProduct extends State<Product>
{
  @override
  Widget build(BuildContext context) {
  var value=false;
    // TODO: implement build
    return MaterialApp(
home:Scaffold(
  body:Container(
    child:Column(
      children: [
        Row(children:[
        Text("is the product still available in stock"),
        Row(
              children:[
                Text("is the product still in stock"),
                SizedBox(width:5),
                Text("Yes"),
                Checkbox(value: value5, onChanged: (bool? value){
                  setState(() {
                    value5=(value)!;
                  });
                }),
                SizedBox(width:3),
                 Text("No"),
                Checkbox(value: value5, onChanged: (bool? value){
                  setState(() {
                    value5=(value)!;
                  });
                })
              ]
            ),
        Text("enter the stock that is still available for the product"),
      TextField(decoration: InputDecoration(
        labelText: "enter the current stock of the product",

      ),),
      SizedBox(height:20),
      Center(child:ElevatedButton(child:Text("Update"),onPressed:() {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Dashboard(),
                          ),
                        );}))
        
      ],
    ),
      ]  
    )

)
     ) );
  }

}
