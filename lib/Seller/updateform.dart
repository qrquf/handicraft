import 'package:ecommerce/Api/subghttp.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Modal%20class/updatemodal.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
import 'package:ecommerce/Seller/proddetails1.dart';
var date;
var id;
var email;
httpServices21 htp=httpServices21();
String? s;
  
class update extends StatefulWidget
{
  update({date1,id1,emm,idp})
  {email=emm;
date=date1;
id=id1;
s=idp.toString();
  }
  @override
  update1 createState()
  {
    return update1();
  }
}
class update1 extends State<update>
{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List<updatemodal>>
      (
      
        future: htp.getAllPost1(id,date) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{

          if(snapshot.hasData)
          {
            print("tt");
          int j=0;
            List<updatemodal>? picture = snapshot.data!;
              for(int i=0;i<picture.length;i++)
              {
                if(picture[i].sId.toString()==id)
                {j++;
                    return ShowPostList(context,picture);
                }
              }
if(j==0)
{
   Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  Dashboard(
                               em: email.toString(),
                               ),
                             ),
                           );
}
return CircularProgressIndicator();
            
          }
          else
          {
            print("fasd");
            return Dashboard(em: email);
             Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  Dashboard(
                               em: email.toString(),
                               ),
                             ),
                           );
                            return CircularProgressIndicator();
          
          }
          //}
        
        //else{
         
        //}
        }),

      )

    );
  }
ShowPostList(BuildContext context,List<updatemodal> posts) 
{
  
 return Scaffold(
  backgroundColor: Colors.purple,
  body:
   ListView.builder(
    shrinkWrap: true,
   

          scrollDirection: Axis.vertical,
      itemCount: posts.length,
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      itemBuilder: (context, index) {
      //  if(posts[index].sId.toString()==id)
        if(posts[index].sId.toString()==id.toString())
        {
        return Column(
          children:
          [
            SizedBox(height:950,width:500,child:addproduct12(
                               id :posts[index].id,
                                name:posts[index].name.toString(),
                               product1:posts[index].product1.toString(),
                               product2: posts[index].product2.toString(),
                               product3: posts[index].product3.toString(),
                               price: posts[index].price,
                               discount: posts[index].discount,
                               sale: posts[index].sale,
        )),
        SizedBox(height:1),
        ElevatedButton(child:Text("remind me later "),onPressed: () {
        Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>Dashboard(em: email)));   
        },),

        ]);       
}
else{
  return SizedBox(width:500,height:10);
}
}
 ));
         
}
}
