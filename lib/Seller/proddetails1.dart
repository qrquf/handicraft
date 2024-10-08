import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/Api/Api_connection.dart';
import 'package:ecommerce/Modal%20class/productmodal1.dart';
import 'package:ecommerce/Api/producthttp.dart';
import 'package:ecommerce/Modal%20class/productmodal.dart';
import 'package:ecommerce/Api/sellerhttp.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:ecommerce/Seller/AddProduct.dart';
import 'package:ecommerce/Seller/Product_images.dart';
import 'package:ecommerce/Seller/prodDetails.dart';
import'./DashComponent.dart';
import'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
var l1,l2,l3;
var idd;
List<String> listitems=["choose category","Wall Painting","Sculpture","Drawing","Pottery","Cubism","Photography","Digital Art"]; 
var selectval="choose category";
   TextEditingController controller=new TextEditingController();
   TextEditingController controller1=new TextEditingController();
   TextEditingController controller2=new TextEditingController();
   TextEditingController controller3=new TextEditingController();
   TextEditingController controller4=new TextEditingController();
   class addproduct12 extends StatefulWidget{
    addproduct12({id,name,product1,product2,product3,discount,price,sale,category})
    {l1=product1;
    l2=product2;
    l3=product3;
    idd=id;
    print("chacha");
    print(product1.toString());
   // print(l[0]);
      controller.text=name;
      controller1.text=price;
      controller2.text=discount;
      controller3.text=sale;
      selectval=category.toString();
      
    }
    @override
    AddProduct createState()
    {
      return AddProduct();
   }}
httpServices13 http2=httpServices13();
class AddProduct extends State<addproduct12>
{
   var value1=false;
 var value2=false;
  var value3=false;
  var value4=false;
   var value5=false;
    var value6=false;
    String? s;
  File? image1,image2,image3;
   Future pickImage(ImageSource src,context) async
  {
    try{
      final image=await ImagePicker().pickImage(source: src);
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
   Future pickImage1(ImageSource source,context) async
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
    body:FutureBuilder<List<prodModal>>
      (
      
        future: http2.getAllPost("") ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<prodModal>? picture = snapshot.data!;
            return ddy(context,picture);
          }
          //}
        
        //else{
          return CircularProgressIndicator();
        //}
        }),

      )
);
  }
  ddy(BuildContext context,List<prodModal> posts)
  {
    
   return  Padding(
      padding:EdgeInsets.all(8.0),
      child:SingleChildScrollView(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          reusableTextField("product", Icons.card_travel, false,controller ),
          SizedBox(height:12),
           reusableTextField("price", Icons.card_travel, false,controller1 ),
          
          SizedBox(height:20.0),
           reusableTextField("discount price", Icons.card_travel, false,controller2 ),
          SizedBox(height:10),
           reusableTextField("Quantity", Icons.card_travel, false,controller3 ),
          SizedBox(height:10),
          /*
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
*/
          SizedBox(height:10),
         SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
            //  image1!=null?Image.file(image1!,width:160,height:160,fit:BoxFit.cover):FlutterLogo(size:160),

               InkWell(
    onTap: () {pickImage(ImageSource.gallery, context);},
    child:image1!=null?
    Card(child:Image.file(image1!,width:100,height:100,fit:BoxFit.cover,)):
    Card(child:Image.network("http://handy.ludokingatm.com/fileupload/"+l1.toString(),width:160,height:160,fit:BoxFit.cover,))
  
  ),
               InkWell(
    onTap: () {pickImage1(ImageSource.gallery, context);},
    child:image2!=null?
    Card(child:Image.file(image2!,width:160,height:160,fit:BoxFit.cover,)):
    Card(child:Image.network("http://handy.ludokingatm.com/fileupload/"+l2.toString(),width:160,height:160,fit:BoxFit.cover,))
  
  ),
               InkWell(
    onTap: () {pickImage3(ImageSource.gallery, context);},
    child:image3!=null?
    Card(child:Image.file(image3!,width:160,height:160,fit:BoxFit.cover,)):
    Card(child:Image.network("http://handy.ludokingatm.com/fileupload/"+l3,width:160,height:160,fit:BoxFit.cover,))
  
  )
  

  
                    ])),
                    SizedBox(height:10),
                    Divider(color:Colors.white),
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
                  )*/
                  SizedBox(height:20)
                  , Center(widthFactor: 100.0,child:ElevatedButton(onPressed:() async{
                  await  http2.saverec(idd,controller.text, image1!.path.toString(),image2!.path.toString() ,image3!.path.toString() , controller1.text.toString(), controller2.text.toString(), controller3.text.toString(),s);
                    Navigator.pop(context);},style:ButtonStyle(),child:Text("Submit",style:TextStyle(color:Colors.green,fontSize: 16)
                    )
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
