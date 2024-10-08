import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Api/userhttp.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Profile%20Page/ProfilePage.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/branding.dart';
import 'package:ecommerce/OnlineShopping/LoginPage.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
import 'package:ecommerce/Seller/DashBoard.dart';
import 'package:ecommerce/Seller/MyOrders.dart';

class HamburgerMenu extends StatelessWidget{
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HamburgerMenu({super.key});
  @override
  Widget build (BuildContext context){
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Siddharth Srivastava"),
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
              onTap: () {
              
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  OnlineShopping(em,pss)
                            ),
                          );
                //scaffoldKey.currentState!.closeDrawer();
              }),
          /*ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text(
              "My Account",

            ),
            onTap: () {
              
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
            onTap: () {Navigator.pushReplacement(
                            context,
                             MaterialPageRoute(
                               builder: (context) => Branding(),
                             ),
                         );}
          ),
           ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text("Settings"),
            onTap:() {
                postApiHttp1 p2=postApiHttp1();
                var f=p2.getAllPost();Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ProfilePage("","",""),
                    ),
                  );}
          ),
           ListTile(
            leading: Icon(
              Icons.roundabout_left,
            ),
            title: Text("About Us"),
            onTap:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  OnlineShopping("","")
                            ),
                          );}
          ),
          /*const ListTile(
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
          ),*/
            ListTile(
            leading: Icon(Icons.logout),
            title: Text("Become a Seller"),
            onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Dashboard()
                            ),
                          );},
          ),
           ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap:() { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LoginPage(),
                    ),
                  );},

          ),
          
        ],
      ),
    );
  }
}
