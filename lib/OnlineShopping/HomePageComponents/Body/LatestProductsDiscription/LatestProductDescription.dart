import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Api/carthttp.dart';
import 'package:ecommerce/Modal class/feedbackmodal.dart';
import 'package:ecommerce/Api/feedhttp.dart';
import 'package:ecommerce/Notification.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Cart/Cart.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/Profile Page/ProfilePage.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/LatestProductsDiscription/comment.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/prod12.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
import '../LatestProducts.dart';

var a;
var b;
var c;
var q;
var category1;
var id1;
var id2;
httpfeed http = httpfeed();

class LatestProductsDescription extends StatefulWidget {
  // Constructor with required parameters
  LatestProductsDescription({
    this.x, 
    this.y, 
    this.z, 
    this.w, 
    required this.category, 
    required this.name, 
    required this.id, 
    required this.pid,
  }) {
    // Initialize variables
    id1 = id;
    id2 = pid;
    category1 = category;
    a = x;
    b = y;
    c = z;
    q = w;

    // Debugging statements
    print("huduk");
    print(id);
    print(id2);
    print(d);
    print(c);
  }

  final String category;
  final String name;
  final String id;
  final String pid;
  final dynamic x, y, z, w;

  @override
  _LatestProductsDescriptionState createState() => _LatestProductsDescriptionState();
}

class _LatestProductsDescriptionState extends State<LatestProductsDescription> {
  var likes = "0";
  var rating = "0";
  var comment = "1";
  TextEditingController com = TextEditingController();
  var d = Colors.lime;
  var x = Icons.favorite_border;
  var y = List.generate(5, (index) => Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Online Shopping"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
            icon: const Icon(Icons.add_shopping_cart_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<feedmodal>>(
        future: http.getAllPost1(id1, id2),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<feedmodal>? picture = snapshot.data!;
            return _buildProductDetails(context, picture);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context, List<feedmodal> posts) {
    int j = 0;
    for (int i = 0; i < posts.length; i++) {
      if (posts[i].pId.toString() == id2) {
        j = 1;
        likes = posts[i].likes.toString();
        comment = posts[i].comment.toString();
        rating = posts[i].rating.toString();
      }
    }
    if (likes != "0") {
      x = Icons.favorite;
      d = Colors.pink;
    }
    if (rating != "0") {
      for (int i = 0; i < int.parse(rating); i++) {
        y[i] = Colors.yellow;
      }
    }

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      children: [
        _buildProductImage(),
        const SizedBox(height: 20),
        _buildProductInfo(),
        // _buildSizeColorQuantitySelectors(context),
        _buildActionButtons(posts),
        const Divider(thickness: 1, color: Colors.grey),
        _buildProductSpecifications(),
        const SizedBox(height: 20),
        _buildRatingSection(posts),
        const SizedBox(height: 20),
        _buildCommentSection(),
        _buildViewCommentsButton(),
        _buildSimilarProductsHeader(),
        const SizedBox(height: 20),
        LatestProducts(),
      ],
    );
  }

  Widget _buildProductImage() {
    return Container(
      width: 200, // Fixed width
      height: 200, // Fixed height
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        child: Image.network(
          b,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text("Image not available")); // Handle image loading errors
          },
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            a,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            q,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 4),
          Text(
            c,
            style: const TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(List<feedmodal> posts) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Contact(id: id2.toString())),
                );
              },
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 0.2,
              child: const Text("Contact Seller"),
            ),
          ),
          const SizedBox(width: 10), // Spacing between buttons
          IconButton(
            onPressed: () async {
              httpServices14 t = httpServices14(pid: id2, uid: id1);
              int j = await t.insertcart1(id1, id2);
              if (j == 0) {
                await t.insertcart(id1, id2);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Product already exists"),
                    content: ElevatedButton(
                      child: const Text("O.K"),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                );
              }
            },
            icon: const Icon(Icons.add_shopping_cart, color: Colors.blue),
          ),
          IconButton(
            onPressed: () => setState(() {
              if (d == Colors.pink) {
                d = Colors.lime;
                likes = "0";
              } else {
                likes = "1";
                d = Colors.pink;
              }
              http.feedupdate(posts[0].uId.toString(), id2.toString(), comment.toString(), likes.toString(), rating.toString());
            }),
            icon: Icon(x, color: d),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSpecifications() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Product Specifications", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 10),
          _buildSpecificationRow("Product Name", a),
          const SizedBox(height: 10),
          _buildSpecificationRow("Product Category", category1.toString()),
          const SizedBox(height: 10),
          _buildSpecificationRow("Likes", likes),
          const SizedBox(height: 10),
          _buildSpecificationRow("Rating", rating),
          const SizedBox(height: 10),
          _buildSpecificationRow("Comments", comment),
        ],
      ),
    );
  }

  Widget _buildSpecificationRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }

  Widget _buildRatingSection(List<feedmodal> posts) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Rate this product", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              for (int i = 0; i < 5; i++)
                IconButton(
                  icon: Icon(Icons.star, color: y[i]),
                  onPressed: () {
                    setState(() {
                      rating = (i + 1).toString();
                      for (int j = 0; j < 5; j++) {
                        y[j] = (j < int.parse(rating)) ? Colors.yellow : Colors.grey;
                      }
                    });
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Leave a Comment", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          TextField(
            controller: com,
            decoration: InputDecoration(
              hintText: "Write your comment...",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  setState(() {
                    comment = com.text;
                    com.clear();
                  });
                  // Add code to send comment to server
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewCommentsButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MaterialButton(
        onPressed: () {
          // Handle view comments button press
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Commentx()),
          );
        },
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 0.2,
        child: const Text("View Comments"),
      ),
    );
  }

  Widget _buildSimilarProductsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        "Similar Products",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
