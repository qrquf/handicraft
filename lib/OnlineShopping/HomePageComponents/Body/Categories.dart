import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/LatestProducts.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/prod12.dart';
var sid;
class Categories extends StatefulWidget {
  Categories({id})
  {
sid=id;

  }
  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return  
   
    Wrap(
     // mainAxisSize: MainAxisSize.min,
      
      children: [
        Align(alignment: Alignment.topLeft, child: Text("Categories")),
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:  <Widget>[
              Catog(
                image: "https://cdn.pixabay.com/photo/2014/07/21/03/53/digital-art-398342__480.png",
                caption: "Wall Painting",
              ),
              Catog(
                image: "https://cdn.pixabay.com/photo/2015/04/23/12/32/hell-735995__480.jpg",
                caption: "Sculpture",
              ),
              Catog(
                image: "https://cdn.pixabay.com/photo/2015/03/05/01/46/sailing-ship-659758__480.jpg",
                caption: "Pottery",
              ),
             
              Catog(
                image: "https://cdn.pixabay.com/photo/2013/10/28/18/51/brandenburger-tor-201939__480.jpg",
                caption: "Cubism",
              ),
              Catog(
                image: "https://cdn.pixabay.com/photo/2013/10/28/18/51/brandenburger-tor-201939__480.jpg",
                caption: "Digital Art",
              ),
              Catog(
                image: "https://cdn.pixabay.com/photo/2013/10/28/18/51/brandenburger-tor-201939__480.jpg",
                caption: "Drawing",
              ),
              Catog(
                image: "https://cdn.pixabay.com/photo/2013/10/28/18/51/brandenburger-tor-201939__480.jpg",
                caption: "Photography",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
var image1;
var cap;
class Catog extends StatelessWidget {
  final image;
  final caption;

   Catog({
  
    this.image,
   this.caption,
  })
  {
    image1=image;
    cap=caption;
    print(cap);
  }
   
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          print("chahch");
          print(caption);Navigator.push(context,
                            MaterialPageRoute(
                               builder: (context) => 
                                
                               SizedBox(height:500,width:500,child:  cate(
                                idd: sid,
                               prod:caption),
                             ),));},
        child: Container(
          margin: EdgeInsets.all(4),
          // height: 50,
          //width: 100,
          child: Column(
            children: [
              CircleAvatar(
                
                radius: 40,
                backgroundImage: NetworkImage(
                  image,
                ),
              ),
              Text(
                caption,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
