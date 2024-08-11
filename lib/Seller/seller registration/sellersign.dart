
//import 'dart:js';

//import 'dart:js';



import 'package:flutter/material.dart';
import 'package:ecommerce/Modal%20class/producthttp.dart';
import 'package:ecommerce/Modal%20class/sellerhttp.dart';
//import 'package:flutter/rendering.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
import 'package:ecommerce/Seller/DashComponent.dart';
import 'package:ecommerce/Seller/seller%20registration/Emailver.dart';
import 'package:regexpattern/regexpattern.dart';

var bus="choose business type";
var rad=["sculpture","cubism","Wall Paintitng","photography"];
List<String> listitems = ["Choose Country","India","United States of America", "Canada", "United Kingdom", "China", "Russia", "Austria"];
String selectval = "Choose Country";



//var pwd=<Widget>[];
//List xxx=<Widget>[SizedBox(height:20,width:20)];
//Widget pwd=new SizedBox(height:30);s
class Sellersign extends StatefulWidget
{  @override
  State<Sellersign> createState() => _SellersignState();
}

class _SellersignState extends State<Sellersign> {
TextEditingController controller=new TextEditingController();
//var size=MediaQuery.of(context).size;
String s="";
var value=false;
var value1=false;
var value2=false;
var value3=false;
var value4=false;
var value5=false;
var sid;

TextEditingController first=new TextEditingController();
TextEditingController second=new TextEditingController();
TextEditingController last=new TextEditingController();
TextEditingController website=new TextEditingController();
TextEditingController mobile=new TextEditingController();
TextEditingController email=new TextEditingController();
TextEditingController city=new TextEditingController();
TextEditingController pincode=new TextEditingController();
TextEditingController Category=new TextEditingController();
//TextEditingController mobile=new TextEditingController();


TextEditingController country_code=new TextEditingController();

TextEditingController state=new TextEditingController();

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home:Scaffold(backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title:Text("Registration",textDirection: TextDirection.ltr,),
        leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color:Colors.white),),
      ),

      body:Container(
        padding: EdgeInsets.all(10),
        child:SingleChildScrollView(
          
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [//for(var s in xxx) s,
              reusableTextField("enter first name ", Icons.person, false,first ),
              SizedBox(height:10),

              reusableTextField("enter middle name ", Icons.person, false,second ),
              SizedBox(height:10),
              
              reusableTextField("enter last name ", Icons.person, false,last ),
              SizedBox(height:10),
              DropdownButtonHideUnderline(child: 
            DropdownButton(
    value: selectval,
    onChanged: (value){
        setState(() {
          selectval = value.toString();
        });
    },
    items: listitems.map((itemone){
        return DropdownMenuItem(
          value: itemone,
          child: Text(itemone)
        );
    }).toList(),
)),
              SizedBox(height:10),
           
            PopupMenuButton<int>(onSelected:(item)=>handleClick(context,item) ,itemBuilder:(context)=> [PopupMenuItem<int>(value: 0,
            child:ElevatedButton.icon(label:Text("Business"),icon: Icon(Icons.group),onPressed:() {
               setState((){
               /* xxx.add(
                ListView(shrinkWrap: true,
                  children:[Row(children: [reusableTextField("enter your company name", Icons.business, true, controller),
  reusableTextField("enter your official address", Icons.location_city, true, controller),

            ])]));*/
              bus="business ";
             // pwd.add(Row(children: [reusableTextField("enter your company name", Icons.business, true, controller),
  //reusableTextField("enter your official address", Icons.location_city, true, controller),

  
  
               })
              
            ;},))
            
            ,
            PopupMenuItem<int>(value:1,child: ElevatedButton.icon(label:Text("Individual"),icon: Icon(Icons.person),onPressed:() {
               setState((){
                bus="Individual ";
                 })
              
            ;},)
            ),
            
             
            ],
            
            child:ListTile(leading: Text(bus) ,trailing:Icon(Icons.arrow_drop_down)),

            /*icon:Icon(Icons.arrow_drop_down) */),
           // pwd,
  // reusableTextField("enter name of the organization", Icons.business, false, ),
           SizedBox(height:10),
          TextField(
            controller: website,
            style: TextStyle(
              
      color: Colors.white.withOpacity(0.9),)
            ,decoration: InputDecoration(
              prefixIcon:Icon(Icons.web),
              fillColor: Colors.white.withOpacity(0.3),filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
              label:Text("enter the Url of the Website"),
              helperText: "this field is optional",
              border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),

            ),
          ),
           
            SizedBox(height:15),
            reusableTextField("enter your mobile no", Icons.mobile_friendly, false, mobile) ,
            //SizedBox(height:10),
SizedBox(height:10),
            reusableTextField("enter your email", Icons.email, false, email),
           SizedBox(height:10),
           /*Card(
            elevation:15,
            color: Colors.white,
            child: 
           TextField(
            //minLines: 5,
            keyboardType: TextInputType.multiline,
         minLines: 5,
         maxLines: 10,
         
            decoration: InputDecoration(
              focusColor: Colors.white,
              labelText: "Enter your City name",
              fillColor: Colors.white
              
              
            ))),*/
             reusableTextField("enter your City name", Icons.email, false, city),
           SizedBox(height:10),

            reusableTextField("enter your state name", Icons.email, false, state),
    SizedBox(height:10),
    reusableTextField("enter your pincode", Icons.email, false, pincode),
    
    SizedBox(height:10),

    reusableTextField("enter your country code", Icons.email, false, country_code),
    SizedBox(height:10),
    
           
            Center(child:Text("choose all the category in which you want to sell the product")),

            SizedBox(height:10),
            Column(
              children:[
            Row(
              children:[
                Text("Sculpture"),
                SizedBox(width:3),
                Checkbox(value: this.value, onChanged: (bool? value){
                  setState(() {
                    s=s+"Sculpture,";
                    this.value=(value)!;
                  });
                })
              ]
            ),
            Row(
              children:[
                Text("Wall painting"),
                SizedBox(width:3),
                Checkbox(value: this.value1, onChanged: (bool? value){
                  setState(() {
                    s=s+"Wall Painting,";
                    this.value1=(value)!;
                  });
                })
              ]
            ),
            Row(
              children:[
                Text("Cubism"),
                SizedBox(width:3),
                Checkbox(value: this.value2, onChanged: (bool? value2){
                  setState(() {
                    s=s+"Cubism,";
                    this.value2=(value);
                  });
                })
              ]
            ),
            Row(
              children:[
                Text("Digital_Art"),
                SizedBox(width:3),
                Checkbox(value: this.value2, onChanged: (bool? value4){
                  setState(() {
                    s=s+"Digital_art,";
                    this.value2=(value4)!;
                  });
                })
              ]
            ),
            Row(
              children:[
                Text("Photography"),
                SizedBox(width:3),
                Checkbox(value: this.value2, onChanged: (bool? value5){
                  setState(() {
                    s=s+"Photography";
                    this.value2=(value5)!;
                  });
                })
              ]
            )
            
              ]),

            /*ListTile(
              leading:Radio(value:"sclupture",groupValue:"sculp" ,onChanged: (value) {
                setState(() {
                  
                });
              },),
              title: Text("Sculpture"),

            ),
            SizedBox(height:3),
            ListTile(
              leading:Radio(value:"wall painting",groupValue:"sculp" ,onChanged: (value) {
                setState(() {
                  
                });
              },),
              title: Text("Wall Painting"),

            ),
            SizedBox(height:3),
            
            ListTile(
              leading:Radio(value:"wall painting",groupValue:"sculp" ,onChanged: (rad) {
                setState(() {
                  
                });
              },),
              title: Text("Cubism"),

            ),*/
            SizedBox(height:3),
            

            ElevatedButton(onPressed:()  {
              if(email.text.length!=0 && mobile.text.length!=0
              && first.text.length!=0 && second.text.length!=0
              && last.text.length!=0 && city.text.length!=0 
              && pincode.text.length!=0 && website.text.length!=0
              && s.length!=0)
              {
                if(mobile.text.length==10 && mobile.text.toString().isNumeric()==true)
              {
                if(country_code.text.length==3 && pincode.text.toString().length==6)
                {
              postApiHttp  http=new postApiHttp();
            http.saveData(first.text.toString(), second.text.toString(), last.text.toString(),selectval.toString(),bus.toString(),website.text.toString(),
            mobile.text.toString(),
             email.text.toString(), city.text.toString(),s.toString(), pincode.text, 
            state.text.toString(), country_code.text.toString());
                }
                else{
                  Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Invalid Country code or Pincode"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));
                }
                        // await GoogleSignInSignUpMethod().signInWithGoogle();
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const OnlineShopping(),
                       }
                       else{
                        Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Invalid no"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));
                       }         //   ),
                        // );
         }
         else{
          Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("Fields can not be left blank"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));

         }       },child: Text("Save And Continue"),)
            
            ],
            
          )
        )
      )
    ))
   ;
  }
} 


void handleClick(context,int item)
{TextEditingController controller=TextEditingController();
  switch(item)
  {
    case 0:
    
    bus="business";
    //ccc(context,bus);
     //{Navigator.pushReplacement(
       //                     context,
         //                    MaterialPageRoute(
           //                    builder: (context) =>  Sellersign(),
             //                ),
               //          );
                        // await GoogleSignInSignUpMethod().signInWithGoogle();
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const OnlineShopping(),
                        //   ),
                        // );
 //                     }
    break;
    case 1:
        bus="individual";
           //ccc(context,bus);
           // xyz(context);
      //  Sellersign();
            
    break;
  }
}