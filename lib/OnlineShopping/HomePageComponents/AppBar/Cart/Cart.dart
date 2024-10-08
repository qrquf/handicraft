import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Api/carthttp.dart';
import 'package:ecommerce/Modal%20class/cartmodal.dart';
import 'package:ecommerce/Modal%20class/productmodal.dart';
import 'package:ecommerce/Api/userhttp.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Cart/CartComponents.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Profile%20Page/ProfilePage.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
import 'package:ecommerce/Modal%20class/selectcartmodal.dart';
import 'package:ecommerce/Modal%20class/userermodal.dart';

var dart;
var eee;

class Cart extends StatefulWidget {
  Cart({emp}) {
    eee = emp;
    print("pagal");
    print(eee);
  }

  @override
  _CartState createState() {
    return _CartState();
  }
}

httpServices14 htp = httpServices14(f: eee);
postApiHttp1 http = postApiHttp1();

class _CartState extends State<Cart> {
  
  @override
  Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

      

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Your Cart"),
        bottom: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
          title: Container(
            width: double.infinity,
            height: screenHeight * 0.05,
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
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnlineShopping("", ""),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("My Account"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.reorder_rounded),
              title: const Text("My Orders"),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(Icons.category_rounded),
              title: Text("Categories"),
            ),
            const ListTile(
              leading: Icon(Icons.branding_watermark_outlined),
              title: Text("Brands"),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            const ListTile(
              leading: Icon(Icons.roundabout_left),
              title: Text("About Us"),
            ),
            const ListTile(
              leading: Icon(Icons.perm_contact_cal_rounded),
              title: Text("Contact"),
            ),
            const ListTile(
              leading: Icon(Icons.help_rounded),
              title: Text("Help"),
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
            )
          ],
        ),
      ),
      body: FutureBuilder<List<selectcart>>(
        future: htp.getAllPost(eee),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              return ShowPostList(context, snapshot.data!);
          }
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        color: Colors.white,
        child: Row(
          children: [
            // Uncomment and adjust below if needed
            /*
            const Expanded(
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
            ),
            */
          ],
        ),
      ),
    );
  }

  ListView ShowPostList(BuildContext context, List<selectcart> posts) {
      final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return ListView.builder(
   
      itemCount: posts.length,
      itemBuilder: (context, index) {
        dart = posts[index].id.toString();
        bool c = true;
        return Visibility(
          maintainSize: c,
          maintainAnimation: c,
          maintainState: c,
          visible: c,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            
            child: Card(
              shadowColor: Color.fromARGB(255, 27, 28, 29),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.blueAccent),
              ),
              elevation: 5,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ListTile(
                leading: Image(
                  height:200,
                  width:50,
                  fit:BoxFit.fill,
                  //height: MediaQuery.sizeOf(context).height*0.05,
                  image: NetworkImage(
                    "http://handy.ludokingatm.com/fileupload/" +
                        posts[index].product1.toString(),
                  ),
                  
                  //fit: BoxFit.fitHeight,
                ),
                title: Text(
                  posts[index].name.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Column(
                  children: [
                    const SizedBox(height: 5),
                    Row(
                       
                      children: [
                        SizedBox(
                          width: screenWidth * 0.4,
                          child: Text(
                            "Qty Available: ${posts[index].sale.toString()}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        const Spacer(),
                      
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "₹${posts[index].price.toString()}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: FittedBox(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          httpServices14 g = httpServices14();
                          g.deletecart(posts[index].uid, posts[index].pid);
                          setState(() {});
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
