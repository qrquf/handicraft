import 'package:flutter/material.dart';
Widget product_Images(label,onPress)
{
  return(InkWell(
    onTap: onPress,
    child:Card(child:Container(
      child:Center(
  child:Text(label,style:TextStyle(color:Colors.grey,fontSize: 16)),),
  height:100,width:100,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color:Colors.white
  ),),
  
  )
  )
  );
}