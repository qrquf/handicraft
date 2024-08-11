import 'package:flutter/material.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
class Emailver extends StatelessWidget
{TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title:Text(
          "Verify your Email"),
          leading:IconButton(onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back))
        ),
        body:Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Enter the otp send to your Email"),
          SizedBox(height:10),
          //reusableTextField("enter otp", Icons.password, true, controller,
          Container(
            color:Colors.white,
          child:Container(
            padding:EdgeInsets.all(10),child:TextField(
            //minLines: 5,
            keyboardType: TextInputType.number,
        // minLines: 5,
         //maxLines: 10,
         
            decoration: InputDecoration(
              labelText: "Enter Otp",
              fillColor: Colors.white,
            
              
              
            )),

          
          )),
          SizedBox(height:10),
          ElevatedButton(onPressed:() {
            Navigator.pushReplacement(
                            context,
                             MaterialPageRoute(
                               builder: (context) =>  Dashboard(),
                             ),
                         );
          },child:Text("Submit",
          ),

          )
          ]
        )
      )),
   );
  }
}