//import 'dart:html';
//import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/Modal%20class/userphotomodal.dart';
import 'package:ecommerce/Api/userhttp.dart';
import 'package:ecommerce/Modal%20class/userphoto.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Profile%20Page/profileupdate.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/Categories.dart';
import 'package:ecommerce/OnlineShopping/LoginPage.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:ecommerce/Seller/seller%20registration/sellerlogin.dart';
import 'package:ecommerce/privacy_policy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/Modal%20class/userermodal.dart';

var d;
var emm,pss,idf,photo;

postApiHttp1 http1=postApiHttp1();
class ProfilePage extends StatefulWidget {
  ProfilePage(em,ps,idd)
  {
    emm=em;
    pss=ps;
    print(emm);
  }
  //const ProfilePage({Key? key}) : super(key: key);
  
  //@override
//  State<ProfilePage> createState() => _ProfilePageState();

@override 
createState() {
return _ProfilePageState();}}

class _ProfilePageState extends State<ProfilePage> {
  // @override
   //void initState() {
    //super.initState();
   //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(icon:Icon(Icons.arrow_back),onPressed: () {Navigator.pop(context);},)
      ),
      body:  FutureBuilder<List<userphoto1>>
      (
      
        future: http1.getuser1(emm) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          //if(snapshot.hasData)
          //{
            List<userphoto1>? picture = snapshot.data!;
            return xxy(context,picture);
          //}
          //else if(snapshot.hasError)
          //{
            //return Text(snapshot.hasError.toString());
         // }
          //}
        
        //else{
          //return CircularProgressIndicator();
        //}
        }),

      )
    );
  }
  ListView xxy(BuildContext context,List<userphoto1> posts)
  {
    var a;
    var b;
    var c;
    var d;
    //print("kam");
  for(int i=0;i<posts.length;i++)
  {if(posts[i].email.toString()==emm && posts[i].password.toString()==pss)
  {
    a=posts[i].name.toString();
    b=posts[i].email.toString();
    c=posts[i].number.toString();
    idf=posts[i].id.toString();
    photo=posts[i].photo.toString();
    if(photo=="")
    {
      photo="http://handy.ludokingatm.com/fileupload/1.jpg";
      
    }
  }}
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) { 
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.limeAccent, Colors.blue, Colors.greenAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                child: Column(
                  children: [
                  
                     CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage("http://handy.ludokingatm.com/fileupload/"+photo)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Stack(
                      children: [
                        Text(a,
                          //d[0].toString(),
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 30,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          a,
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                    //  d[1].toString(),
                      b,style: GoogleFonts.lavishlyYours(
                          textStyle:
                              TextStyle(fontSize: 19, color: Colors.white)),
                    ),
                    Stack(
                      children: [
                        Text(c
                          //posts[index].number.toString()
                        //  d[2].toString(),
                          ,style: GoogleFonts.calistoga(
                            textStyle: TextStyle(
                              fontSize: 30,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 5
                                ..color = Colors.black,
                            ),
                          ),
                        ),
                        Text(c,
                          //posts[index].number.toString(),
                          style: GoogleFonts.calistoga(
                            textStyle: const TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              buttons(context, "Edit Profile",() {
              //  postApiHttp1 f=postApiHttp1();
                //f.saveData2(emm, pss)
                
                Navigator.push(context,
                            MaterialPageRoute(
                               builder: (context) =>  ProfileUpdate(emm,pss,c,a),
                             ),);
              },),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              buttons(context, "Log Out", (){Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    LoginPage(x:0)), (Route<dynamic> route) => false);}),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              buttons(context, "Update Profile pic", (){
                Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) => ImagePickerApp(image2:photo),
                             ),
                           );
              },),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              buttons(context, "Privacy Policy", (){Navigator.pushReplacement(
                            context,
                             MaterialPageRoute(
                               builder: (context) =>Privacy(),
                             ),
                         );},),
            ],
          ),
        ),
      );
  });
    
  
    }
}

  


 /*pickImage() async 
{
final image=await ImagePicker().pic=kImage(source: ImageSource.gallery).toString();
if(image==null) return;
// ignore: unused_local_variable
var image2 = image;
final image3=await ImagePicker().pickImage(source: ImageSource.gallery);
inal  imageTemporary=File(List<Object> image);
}
*/
var dd;
class ImagePickerApp extends StatefulWidget{
 ImagePickerApp({image2})
 {
dd=image2;
 }
 @override

 ImagePickerAppState createState()
 {
  return ImagePickerAppState();
 }

}
class ImagePickerAppState extends State<ImagePickerApp>
{
File? image;
  Future pickImage(ImageSource source) async
  {
    try{
      final image=await ImagePicker().pickImage(source: source);
      if(image==null) return;
      final imagetemp=File(image.path);
      setState(() {
        
        this.image=imagetemp;

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
  
@override 
Widget build(BuildContext context)
{return Scaffold(
appBar: AppBar(
  title:Text("Image Picker app")
),
body:Center(child:Column(
  children:[
    Spacer(),
  image!=null?Image.file(image!,width:160,height:160,fit:BoxFit.cover):Container(height:100,width:100,
  child:Image.network("http://handy.ludokingatm.com/fileupload/"+photo.toString())),

  ElevatedButton(onPressed:() {pickImage(ImageSource.gallery);},
  child:Text("Pick Gallery")),
  SizedBox(height: 10,),
  ElevatedButton(onPressed: () {
    http1.savephoto(idf,image!.path);
    setState(() {
      
    });


  }, child:Text("Submit") )
  ]
))
);} 
  //@override
 // Widget build(BuildContext context) {
    // TODO: implement build
     }

