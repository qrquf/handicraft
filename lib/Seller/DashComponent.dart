import 'package:flutter/material.dart';
Widget dashBoardButton(context,{title,count,icon1})
{var size=MediaQuery.of(context).size;
  return Card(child:Container(
    width: MediaQuery.of(context).size.width*0.39,
    height:MediaQuery.of(context).size.height*0.26,
    
    
//    color: Colors.red,
    child:SingleChildScrollView(child:Row(
            children:[
            
              Expanded(child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[

Text(title,style:TextStyle(fontSize:10,fontWeight: FontWeight.bold,color: Colors.black.withBlue(23)),textAlign: TextAlign.center,),
//Text(count,style:TextStyle(fontSize: 7.0),textAlign: TextAlign.center),

                ]
              )
              )
            ,
            SizedBox(width:5.0),
            
             Align(child: Icon(icon1,color: Colors.black.withOpacity(0.2),size: MediaQuery.of(context).devicePixelRatio*30.0,),
            alignment: Alignment.center,)

    ],
           // spacing: 5,
            
    )),
    decoration: BoxDecoration(
      
      color:Colors.grey,
      borderRadius: BorderRadius.circular(10.0),
       /*boxShadow: [
                      BoxShadow(
                        color: Colors.purple,
                        blurRadius: 15,
                        //spreadRadius: 40,
                        //blurStyle: BlurStyle.normal,
                      ),
                      BoxShadow(
                        color: Colors.pink,
                        blurRadius: 16,
                        //spreadRadius: -1,
                      ) //blurStyle: BlurStyle.normal)
       ]*/
      
    ),
          )
          ,
          elevation: 10.0,);
} 
          Widget productDropDown(context,value)
          {
            return DropdownButtonHideUnderline(
              child:DropdownButton<String>
            (items: [], onChanged:(value) {},borderRadius: BorderRadius.circular(12.0), 
            hint:Text(value)           ),
            
            );

          }