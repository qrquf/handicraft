import 'package:flutter/material.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
///import 'package:';
class MyOrders extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar:AppBar(title: Text("Orders"),
      leading: IconButton(onPressed:() {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );}, icon: Icon(Icons.arrow_back,color:Colors.white),),

      ),
      body:Padding(
        padding:EdgeInsets.all(10),
        child:SingleChildScrollView(
          child:
        Column(
          children: [
              for(int i=0;i<20;i++)InkWell(child:Card(elevation: 20,child: ListTile(
                tileColor: Color.fromARGB(255, 190, 47, 47),
                trailing: Text("\$40",style: TextStyle(color:Color.fromARGB(255, 158, 150, 150)),),
           // leading: Image.asset("sasha.jpeg",width: 100,height: 100,fit: BoxFit.cover,),
            title: Text("098878667676",style:TextStyle(color: Color.fromARGB(255, 48, 46, 46),fontWeight: FontWeight.bold)),
            subtitle:Column(
              children:[
                Text(DateTime.now().toString()),
                Row(
                  children:[
                    Icon(Icons.calendar_month),
                    SizedBox(width:4.0),
             
             
          ]
          )
          ]
          )
          )
          )),
          ],
        )
      )
    )));
  }

}