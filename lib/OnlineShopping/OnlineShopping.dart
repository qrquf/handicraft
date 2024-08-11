//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerce/ImageSlider.dart';
import 'package:ecommerce/Modal%20class/userhttp.dart';
import 'package:ecommerce/Notification.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Cart/Cart.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Profile%20Page/ProfilePage.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/Aboutus.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/branding.dart';
import 'package:ecommerce/OnlineShopping/LoginPage.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
import 'package:ecommerce/Seller/MyOrders.dart';
import 'package:ecommerce/Seller/seller%20registration/sellerlogin.dart';
import 'package:ecommerce/contact1.dart';
import 'package:ecommerce/footer.dart';
import 'package:ecommerce/userer.dart';

import 'HomePageComponents/Body/Brands.dart';
import 'HomePageComponents/Body/Categories.dart';
import 'HomePageComponents/Body/ImageSwiper.dart';
import 'HomePageComponents/Body/LatestProducts.dart';
LatestProducts l=new LatestProducts();
var  em,ps;
var key="";
postApiHttp1 http=new postApiHttp1();

class OnlineShopping extends StatefulWidget {
   OnlineShopping(email,password)
  {
    em=email;
    ps=password;

  }
  @override
  OnlineShoppingState createState() {
    return OnlineShoppingState();
  }
  
}
var y=[Colors.grey,Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,];
class OnlineShoppingState extends State<OnlineShopping> {
   @override
   void initState() {
    super.initState();
   }
PageController controller=new PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
//  final _googleSignIn = GoogleSignIn();
  //final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
        

          //toolbarHeight: 100,
          elevation: 0,
          title: const Text("Online Shopping"),
          actions: [
            
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Cart(emp:em),
                  ),
                );
              },
              icon: Icon(Icons.notifications),
            ),
            
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Cart(emp:em),
                  ),
                );
              },
              icon: const Icon(Icons.local_grocery_store),
            ),
            IconButton(
              onPressed: () {
                //postApiHttp1 p1=postApiHttp1();
               //var v=p1.getAllPost();

               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(em,ps,""),
                  ),
                );
              },
              icon: const Icon(Icons.person),
            ),
          ],
          bottom: AppBar(
            automaticallyImplyLeading: false,
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: Center(
                child: TextField(
                  onChanged:(value)=>setState(() {
                    key=value;
                    
                  }),
                
                  
                  decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              key;
                            });
                          },
                          icon: const Icon(Icons.camera_alt))),
                ),
              ),
            ),
          ),
        ),
        drawer: xyz(context),
        body:FutureBuilder<List<userser>>
      (
      
        future: http.getAllPost3(em) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<userser>? picture = snapshot.data!;
            return showdat(context,picture);
          }
          //}
        
        //else{
          return CircularProgressIndicator();
        //}
        }),

      )
      ))
    ;
  }
}
showdat(BuildContext context,List<userser> posts)
{

  return SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child:  Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Wrap(
              
              children: [
                //Image Slider Component
           //    ImageSwiper(),
                const SizedBox(
                  height: 10,
                ),

                //Categories Component
                Categories(id:posts[0].id),
                const SizedBox(
                  height: 15,
                ),

                //Brands Component
                const Brands(),
                const SizedBox(
                  height: 15,
                ),

                //Latest Products
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Latest Products"),
                  
                ),
                
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[Container(
                    constraints: BoxConstraints(
                      //maxHeight: double.infinity,
                      //maxWidth: double.infinity,
                    ),
                  child:
        LatestProducts(idd:posts[0].id ,prod: ""),
        
         )]),
              SizedBox(height:10),
              //SingleChildScrollView(child:MyApp())
              
            //  Aboutus()
              ],
            ),
          ),
        );
}
Widget xyz(context)
{
  return Drawer(
          child: ListView(
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("Siddharth srivastava"),
                accountEmail: Text("siddharthsrivastava117@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(
                    "SS",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              ListTile(
                  leading: const Icon(CupertinoIcons.house_fill),
                  title: const Text(
                    "Home",
                  ),
                  onTap: () {Navigator.pushReplacement(
                            context,
                             MaterialPageRoute(
                               builder: (context) =>  OnlineShopping(em,ps),
                             ),
                         );
                    
                  }),
              /*ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text(
                  "My Account",
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
              ),*/
              ListTile(
                leading: const Icon(Icons.reorder_rounded),
                title: const Text(
                  "My Orders",
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  MyOrders(),
                    ),
                  );
                },
              ),
              const ListTile(
                leading: Icon(
                  Icons.category_rounded,
                ),
                title: Text("Categories"),
              ),
               ListTile(
                leading: Icon(
                  Icons.branding_watermark_outlined,
                ),
                title: Text("Brands"),
                onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Branding(),
                    ),
                  );}
              ),
               ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: Text("Settings"),
                onTap: () async { 
                    postApiHttp1 p2=  postApiHttp1();
                await p2.getAllPost();
                print("ggg");
                List<dynamic> d=await p2.givedata5();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ProfilePage(em,ps,""),
                    ),
                  );},
              ),
               ListTile(
                leading: Icon(
                  Icons.roundabout_left,
                ),
                title: Text("About Us"),
                onTap: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Contact1(),
                    ),
                  );},
              ),
              /*const ListTile(
                leading: Icon(
                  Icons.perm_contact_cal_rounded,
                ),
                title: Text("Contact"),
              ),*/
              ListTile(
            leading: Icon(Icons.logout),
            title: Text("Become a Seller"),
            onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  LoginPage1()
                            ),
                          );},
          ),
               ListTile(
                leading: Icon(
                  Icons.star,
                ),
                title: Text("Rate us"),
                onTap:() {Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("rate our app"),
                  content:
                    Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                 children:[for(int i=0;i<5;i++) IconButton(onPressed: ()=>  {
                              for(int j=i;j>=0;j--)
                              {
                            
                                y[j]=Colors.yellow,
                      
                            },
                            for(int k=i+1;k<5;k++)
                            {
                              y[k]=Colors.grey,
                            }
                              
                            }, icon: Icon(Icons.star,color:y[i]))
                    ]
                  ),
                  actions: [
                    TextButton(onPressed: () {Navigator.pop(context);}, child: Text("O.K"))
                  ],
                )
                )
                ));
                }
              ),
              ListTile(
                onTap: () async {
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    LoginPage(x:0)), (Route<dynamic> route) => false);
                  //await GoogleSignInSignUpMethod().signOut();
                  // await FirebaseAuth.instance.signOut().then(
                  //       (value) => Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const LoginPage(),
                  //         ),
                  //       ),
                  //     );
                },
                leading: const Icon(Icons.logout),
                title: const Text("Log Out"),
              )
            ],
          ),
        );}
       