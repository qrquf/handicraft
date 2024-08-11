import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Modal%20class/carthttp.dart';
import 'package:ecommerce/Modal%20class/cartmodal.dart';
import 'package:ecommerce/Modal%20class/productmodal.dart';
import 'package:ecommerce/Modal%20class/userhttp.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Cart/CartComponents.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Profile%20Page/ProfilePage.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
import 'package:ecommerce/selectcart.dart';
import 'package:ecommerce/userer.dart';
var dart;
var eee;

class Cart extends StatefulWidget {
  Cart({emp})
  {eee=emp;
  print("pagal");
  print(eee);
 // print(emp);

  }
   @override
  _CartState createState() {
    return _CartState();
  }
  //const Cart({Key? key,emp}) : super(key: key);

  //@override
  //State<Cart> createState() => _CartState();
}
 httpServices14 htp=httpServices14(f:eee);
postApiHttp1 http=postApiHttp1();
class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 100,
        elevation: 0,
        title: const Text("Your Cart"),
        bottom: AppBar(
          leading: IconButton(icon:Icon(Icons.arrow_back),onPressed:() { Navigator.pop(context);},),
          automaticallyImplyLeading: false,
          title: Container(
            width: double.infinity,
            height: 40,
            color: Colors.white,
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(CupertinoIcons.search),
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Sid Sri"),
              accountEmail: Text("siddharthSri@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  "VV",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.house_fill),
              title: const Text(
                "Home",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  OnlineShopping("",""),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text(
                "My Account",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.reorder_rounded),
              title: const Text(
                "My Orders",
              ),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(
                Icons.category_rounded,
              ),
              title: Text("Categories"),
            ),
            const ListTile(
              leading: Icon(
                Icons.branding_watermark_outlined,
              ),
              title: Text("Brands"),
            ),
            const ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text("Settings"),
            ),
            const ListTile(
              leading: Icon(
                Icons.roundabout_left,
              ),
              title: Text("About Us"),
            ),
            const ListTile(
              leading: Icon(
                Icons.perm_contact_cal_rounded,
              ),
              title: Text("Contact"),
            ),
            const ListTile(
              leading: Icon(
                Icons.help_rounded,
              ),
              title: Text("Help"),
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
            )
          ],
        ),
      ),
      body: FutureBuilder<List<selectcart>>
      (
      
        future: htp.getAllPost(eee) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
         // if(snapshot.hasData)
         // print(snapshot.data);
         switch(snapshot.connectionState)
         {case ConnectionState.none:

          case ConnectionState.done:
            //List<selectcart> picture = snapshot.data!;
            //print("mm");
            return ShowPostList(context,snapshot.data!);
          
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return ShowPostList(context,snapshot.data!);
          
          
          //}
        
        //else{
          //return CircularProgressIndicator();
        //}
        }}),

      ),
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.only(left: 20,right: 20),
          color: Colors.white,
          child: Row(
            children: [
              /*const Expanded(
                child: ListTile(
                  title: Text("Total : "),
                  subtitle: Text("599"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
  
  ListView ShowPostList(BuildContext context, List<selectcart> posts) {
print(eee);
//print(posts[7].id);
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        dart=posts[index].id.toString();
      print(posts[index].id.toString());
     //   if(posts[index].email==eee)
       //
//print(dart);
bool c=true;
        return Visibility(
          maintainSize: c,
          maintainAnimation: c,
          maintainState: c,
          
          visible: c,child:  SizedBox(
      height: 120,
      child: Card(
        shadowColor: Color.fromARGB(255, 27, 28, 29),
        //surfaceTintColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.blueAccent
          )
        ),
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ListTile(
          //Product Image
          leading: Image(
            image: NetworkImage("http://handy.ludokingatm.com/fileupload/"+posts[index].product1.toString()),
            //height: 200,
            //width: 100,
            fit: BoxFit.contain,
          ),
          //Product name
          title: Text(
            posts[index].name.toString(),
            style: const TextStyle(fontSize: 20),
          ),

          subtitle: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              //Product Size and Color
              Row(
                children: [
                  SizedBox(width: 84,child: Text("Qty Available: ${posts[index].sale.toString()}",style: TextStyle(fontSize: 12),),),
                  const Spacer(),
                  SizedBox(width: 74,child: Text("Size : 120*120 cm",style: TextStyle(fontSize: 12),),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //Product Price
              Container(
                alignment: Alignment.topLeft,
                child: Text("₹${posts[index].price.toString()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
              )
            ],
          ),
          trailing: FittedBox(
            child: Row(
              children: [
                //IconButton(onPressed: (){}, icon: Icon(Icons.add),),
                //Text("${posts[index].price}"),
                IconButton(onPressed: (){
                  httpServices14 g=httpServices14();
                  g.deletecart(posts[index].uid,posts[index].pid );
                  setState(() {
                 
                  });
                }, icon: const Icon(Icons.remove),),
              ],
            ),
          ),
        ),
      ),
    )); 
        
        
      }
       
    );

  }

}
var pid;

class Xammpp extends StatelessWidget
{
 
  Xammpp(
  var  c
  )
  {
pid=c;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return FutureBuilder(
    
    future:htp.getAllPost(eee),
    builder: ((context, snapshot) {
      //print(snapshot);
          //if(snapshot.hasData)
          //{
         // if(snapshot.hasData)
          //{
            List<selectcart>? picture = snapshot.data!;
            return ShowPostList1(context,picture);
          //}
          //}
        
        //else{
          return CircularProgressIndicator();
        //}
        }));
  }

}
 ShowPostList1(BuildContext context, List<selectcart> posts) {

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return SizedBox(
      height: 120,
      child: Card(
        shadowColor: Colors.blue,
        //surfaceTintColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.blueAccent
          )
        ),
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ListTile(
          //Product Image
          leading: Image(
            image: NetworkImage("http://handy.ludokingatm.com/fileupload/"+posts[index].product1.toString()),
            //height: 200,
            //width: 100,
            fit: BoxFit.contain,
          ),
          //Product name
          title: Text(
            posts[index].name.toString(),
            style: const TextStyle(fontSize: 20),
          ),

          subtitle: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              //Product Size and Color
              Row(
                children: [
                  SizedBox(width: 84,child: Text("Qty Available: ${posts[index].sale.toString()}",style: TextStyle(fontSize: 12),),),
                  const Spacer(),
                  SizedBox(width: 74,child: Text("Size : 120*120 cm",style: TextStyle(fontSize: 12),),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //Product Price
              Container(
                alignment: Alignment.topLeft,
                child: Text("₹${posts[index].price.toString()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
              )
            ],
          ),
          trailing: FittedBox(
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.add),),
                Text("${posts[index].price}"),
                IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.minus),),
              ],
            ),
          ),
        ),
      ),
    );;
      } 

        );
      }
    

  

