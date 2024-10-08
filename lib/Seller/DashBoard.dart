import 'package:flutter/material.dart';
import 'package:ecommerce/Api/sellerhttp.dart';
import 'package:ecommerce/Modal%20class/sellermodal1.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/HamburgerMenu.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/LatestProducts.dart';
import 'package:ecommerce/Seller/AddProduct.dart';
import 'package:ecommerce/Seller/Seller_Subcription.dart';
import 'package:ecommerce/Seller/quede.dart';
import 'package:ecommerce/Seller/viewsubs.dart';
import 'package:google_fonts/google_fonts.dart';

postApiHttp http = postApiHttp();
var email;

class Dashboard extends StatelessWidget {
  Dashboard({em})
  {
    email=em;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Seller Dashboard",
          style: GoogleFonts.roboto(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, // Transparent to see gradient background
        elevation: 0, // No shadow for a cleaner look
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                DateTime.now().toString().substring(0, 10),
                style: GoogleFonts.roboto(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      drawer: HamburgerMenu(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB92B27), // Darker red (start color)
              Color(0xFF1565C0), // Blue (end color)
            ],
          ),
        ),
        child: FutureBuilder<List<sellmode>>(
          future: http.getAllPost(email),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<sellmode>? data = snapshot.data;
              return buildDashboard(context, data!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildDashboard(BuildContext context, List<sellmode> posts) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subscription and Add Products Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashboardCard(
                  context,
                  title: "Subscription Status",
                  icon: Icons.subscriptions_outlined,
                  color: Colors.lightBlueAccent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => subs(id: posts[0].id.toString()),
                      ),
                    );
                  },
                ),
                dashboardCard(
                  context,
                  title: "Add Products",
                  icon: Icons.add_shopping_cart,
                  color: Colors.orangeAccent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProduct12(posts[0].id.toString()),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Buy Subscription and All Products Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashboardCard(
                  context,
                  title: "Buy Subscription",
                  icon: Icons.shopping_bag,
                  color: Colors.greenAccent,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HandySubscription(posts[0].id.toString()),
                      ),
                    );
                  },
                ),
                dashboardCard(
                  context,
                  title: "All Products",
                  icon: Icons.production_quantity_limits,
                  color: Colors.redAccent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Qued1(dd: posts[0].id),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30),

            // Popular Products Section
            Text(
              "Popular Products by You",
              style: GoogleFonts.roboto(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            LatestProducts(),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(BuildContext context, {required String title, required IconData icon, required Color color, required Function onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        elevation: 10.0,
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width * 0.4,
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
