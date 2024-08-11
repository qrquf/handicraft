//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/Api/Api_connection.dart';
import 'package:ecommerce/Modal%20class/product.dart';
import 'package:ecommerce/Modal%20class/producthttp.dart';
import 'package:ecommerce/Modal%20class/sellerModal.dart';
import 'package:ecommerce/Modal%20class/subg.dart';
import 'package:ecommerce/Modal%20class/subghttp.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:ecommerce/Seller/Product_images.dart';
import'./DashComponent.dart';
import'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
httpServices21 htt=httpServices21();
   TextEditingController controller=new TextEditingController();
   TextEditingController controller1=new TextEditingController();
   TextEditingController controller2=new TextEditingController();
   TextEditingController controller3=new TextEditingController();
   TextEditingController controller4=new TextEditingController();
   var sid;
   String s="";

   class addproduct1 extends StatefulWidget{
    addproduct1(var v1)
    {sid=v1;}
    @override
    AddProduct createState()
    {
      return AddProduct();
    }
   }

class AddProduct extends State<addproduct1>
{   var value1=false;
 var value2=false;
  var value3=false;
  var value4=false;
   var value5=false;
    var value6=false;
  File? image1,image2,image3;

   Future pickImage(ImageSource source,context) async
  {
    try{
      final image=await ImagePicker().pickImage(source: source);
      if(image==null) return;
      final imagetemp=File(image.path);
      
      setState(() {
        image1=imagetemp;
        
      });
    }
    on PlatformException catch (e)
    {
      return showDialog(
        context:context,
        builder:(BuildContext context) 
        {return AlertDialog(title:Text("Failed to pick image:"),
        content:Text("$e"),
        );
        }
      );
    } 
  }
  
   Future pickImage2(ImageSource source,context) async
  {
    try{
      final image=await ImagePicker().pickImage(source: source);
      if(image==null) return;
      final imagetemp=File(image.path);
      
      setState(() {
        image2=imagetemp;
        
      });
    }
    on PlatformException catch (e)
    {
      return showDialog(
        context:context,
        builder:(BuildContext context) 
        {return AlertDialog(title:Text("Failed to pick image:"),
        content:Text("$e"),
        );
        }
      );
    } 
  }
   
   Future pickImage3(ImageSource source,context) async
  {
    try{
      final image=await ImagePicker().pickImage(source: source);
      if(image==null) return;
      final imagetemp=File(image.path);
      
      setState(() {
        image3=imagetemp;
        
      });
    }
    on PlatformException catch (e)
    {
      return showDialog(
        context:context,
        builder:(BuildContext context) 
        {return AlertDialog(title:Text("Failed to pick image:"),
        content:Text("$e"),
        );
        }
      );
    } 
  }

   final color=[Colors.white,Colors.black,Colors.blue,
   Colors.yellow,
   Colors.green,
   Colors.pink,
   Colors.yellow,
   Colors.orange,
   Colors.red,
   Colors.amber,
   Colors.grey,
   ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.purple,
    appBar:AppBar(
      leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color:Colors.white),),
      title:Text("add product ",style:TextStyle(fontSize: 16)),
      actions:[
        TextButton(onPressed:(){productpic(context);},child:Text("save",style:TextStyle(color:Colors.purple)))
      ]
    ),
    body:FutureBuilder<List<subg>>
      (
      
        future: htt.getAllPost(sid) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<subg>? picture = snapshot.data!;
            return cct(context,picture);
          }
          //}
        
        //else{
          return CircularProgressIndicator();
        //}
        }),

      )
  );
  }
  cct(BuildContext context,List<subg> posts)
  {var y=0;
    for(int i=0;i<posts.length;i++)
    {
      y++;
    }
    if(posts[0].subsValue==null && y<=1)
    {
      print("bye1");
      print(y);
      return blue(context);
    }
   //else if(posts[0].subsValue==null && y>1)
   //{
    //return Center(child:Container(height:200,width: 200,
     // child:ElevatedButton(
        
      //  onPressed: () {
        //  Navigator.pop(context);
      

        //},
        //child:Text("You Have Exceeded your Product Limit in order to add more product please upgrade your plan")
     // )));
   //} 
    
    else if(y<=1 && posts[0].subsValue!=null && int.parse(posts[0].subsValue.toString())==0)
    {
return blue(context);

    }
    else if(y<=3 && posts[0].subsValue!=null && int.parse(posts[0].subsValue.toString())==2)
    {
      print(y);
      print("kabira");
return blue(context);
    }
    else if(y<=10 &&  posts[0].subsValue!=null && int.parse(posts[0].subsValue.toString())==3)
    {
      return blue(context);
    }
    else 
    {
      return   Center(child:Container(height:200,width: 200,
      child:ElevatedButton(
        
        onPressed: () {
          Navigator.pop(context);
      

        },
        child:Text("You Have Exceeded your Product Limit in order to add more product please upgrade your plan")
      )));
    }
  }
    blue(BuildContext context)
    {
    return Padding(
      padding:EdgeInsets.all(8.0),
      child:SingleChildScrollView(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          reusableTextField("product", Icons.card_travel, false,controller ),
          SizedBox(height:12),
          reusableTextField("Actual price", Icons.card_travel, false,controller1 ),
          SizedBox(height:12),
          

      
          SizedBox(height:20.0),
           reusableTextField("Discount price", Icons.card_travel, true,controller2 ),
          SizedBox(height:10),
           reusableTextField("Quantity", Icons.card_travel, true,controller3 ),
          SizedBox(height:10),
           Column(
              children:[
                Center(child:Text("choose Category")),
            SizedBox(height:4),
            Row(
              children:[
                Text("Sculpture"),
                SizedBox(width:3),
                Checkbox(value: this.value1, onChanged: (bool? value){
                  setState(() {
                    s="Sculpture";
                    this.value1=(value)!;

                  });
                })
              ]
            ),
            Row(
              children:[
                Text("Wall painting"),
                SizedBox(width:3),
                Checkbox(value: this.value2, onChanged: (bool? value){
                  setState(() {
                    s="Wall Painting";
                    this.value2=(value)!;
                                        value1=false;
                    value3=false;
                    value4=false;
                    value5=false;

                  });
                })
              ]
            ),
            
            Row(
              children:[
                Text("Cubism"),
                SizedBox(width:3),
                Checkbox(value: this.value3, onChanged: (bool? value){
                  setState(() {
                    s="Cubism";
                    this.value3=(value)!;
                                        value1=false;
                    value2=false;
                    value4=false;
                    value5=false;

                  });
                })
              ]
            ),
            Row(
              children:[
                Text("Digital_Art"),
                SizedBox(width:3),
                Checkbox(value: this.value4, onChanged: (bool? value){
                  setState(() {
                    s="Digital_art";
                    this.value4=(value)!;
                                        value1=false;
                    value2=false;
                    value3=false;
                    value5=false;

                  });
                })
              ]
            ),
            Row(
              children:[
                Text("Photography"),
                SizedBox(width:3),
                Checkbox(value: this.value5, onChanged: (bool? value){
                  setState(() {
                    s="Photography";
                    this.value5=(value)!;
                    value1=false;
                    value2=false;
                    value3=false;
                    value4=false;

                  });
                })
              ]
            )
            
              ]),
          //productDropDown(context,"choose Categories"),
          //SizedBox(height:10),
           
SizedBox(height:10),

Center(child:Text("choose pictures of the product"),),
SizedBox(height:10),

       SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:   Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
            //  image1!=null?Image.file(image1!,width:160,height:160,fit:BoxFit.cover):FlutterLogo(size:160),

               InkWell(
    onTap: () {pickImage(ImageSource.gallery,context);},
    child:image1!=null?
    Card(child:Image.file(image1!,width:160,height:160,fit:BoxFit.cover,)):FlutterLogo(size:150)
  
  ),
               InkWell(
    onTap: () {pickImage2(ImageSource.gallery, context);},
    child:image2!=null?
    Card(child:Image.file(image2!,width:160,height:160,fit:BoxFit.cover,)):FlutterLogo(size:150)
  
  ),
               InkWell(
    onTap: () {
      print(image1.toString());
      pickImage3(ImageSource.gallery, context);},
    child:image3!=null?
    Card(child:Image.file(image3!,width:160,height:160,fit:BoxFit.cover,)):FlutterLogo(size:150)
  
  ),
                    ])),
                    SizedBox(height:10),
                    Divider(color:Colors.white),
                 /* Text("choose Product Color"),
                  SizedBox(height:30),
                  Wrap(
                    spacing: 4.0,
                    runSpacing: 10.0,
                    children: [
                    for(int i=0;i<6;i++) InkWell(
                      child:Stack(children:[Container(
                        decoration: BoxDecoration(
                          color: color[i],
                          borderRadius:BorderRadius.circular(100),

                        ),
                        height:100,
                        width:100
                      ),
                       Icon(Icons.done),
                    ],
                   
                    ),
                   
                  )
                  ]
                  ),*/
                  SizedBox(height:20)
                  , Center(widthFactor: 100.0,child:ElevatedButton(onPressed:() {

                    print(sid);
                    httpServices13 htp=httpServices13();
                    htp.saverec1(sid,controller.text,image1!.path.toString(),image2!.path.toString(),image3!.path.toString(),controller1.text.toString(),controller2.text,
                    controller3.text,s);
   Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("your Product is Live Now"),
                  content:ElevatedButton(child:Text("O.K"),onPressed: () {Navigator.pop(context);},)))));
                    
                    (context);},style:ButtonStyle(),child:Text("Submit",style:TextStyle(color:Colors.green,fontSize: 16))
                    )
                    )
                  
                    
          

        ]
      )
    )
  );
  }
  Future productpic(BuildContext context)
{
  return showModalBottomSheet(shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
  ),
  context: context,builder: (context)
  {
return SizedBox(height: MediaQuery.of(context).size.height*0.12,
child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        IconButton(onPressed:() {
        pickImage(ImageSource.gallery, context);}, icon: Icon(Icons.photo,size:40)),
        Text("Gallery")


      ]
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        IconButton(onPressed: () {}, icon: Icon(Icons.camera,size:40)),
        Text("Camera")


      ]
    ),
    
  ],
));
  }
);

}

}
SaveRecord2(context) async
{
product user= product(controller.text.trim(),controller2.text.trim(),controller2.text.trim(),controller3.text.trim());
try{
  
var res=await http.post(Uri.parse(
  Api.addproduct
),body:user.toJson());
if(res.statusCode==200)
{
  //var resBody1=jsonDecode(res.body);
  String resBody=res.body;
    if((resBody)=="false")
  {
 AlertDialog(
        content: Text("Record Saved"),
        actions: [ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("O.K"))],

      );    
  }
  else{
    AlertDialog(
        content: Text("Record not Saved"),
        actions: [ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("O.K"))],

      );    
  }
}
else{
  AlertDialog(
        content: Text("Record Saved"),
        actions: [ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("O.K"))],

      );    
}
}
catch(e){
  print(e);
}
}

class ppp{

  
}

