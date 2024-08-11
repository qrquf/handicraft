import 'package:flutter/material.dart';

class Brands extends StatefulWidget {
  const Brands({super.key});

  @override
  BrandsState createState() => BrandsState();
}

class BrandsState extends State<Brands> {
  final brandList = [
    {"name": "Asha", "image": "Shirts.jpg"},
    {"name": "Craft Maestros", "image": "T-Shirts.jpg"},
    {"name": " ", "image": "Footwear.jpg"},
    {"name": "Beauty Products", "image": "Beauty_Products.jpg"},
    {"name": "Appliances", "image": "Appliances1.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text("Brands")),
        SizedBox(
          height: 135,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              Brands1(
                image: "https://asha.ashahandicrafts.in/wp-content/uploads/2021/04/YELLOW-ASHA-Logo.png",
                caption: "Asha Handicraft Assocition",
              ),
              Brands1(
                image: "https://media.craftmaestros.com/media/athlete2/default/Craft_Maestros_Logo.png",
                caption: "Craft Maestros",
              ),
              Brands1(
                image: "https://gaatha.com/wp-content/webpc-passthru.php?src=https://gaatha.com/wp-content/uploads/2019/01/gaatha-logo.png&nocache=1",
                caption: "Gaath Association",
              ),
              Brands1(
                image: "https://asha.ashahandicrafts.in/wp-content/uploads/2021/04/YELLOW-ASHA-Logo.png",
                caption: "Sasha Handicraft",
              ),
              Brands1(
                image: "https://cdn.shopify.com/s/files/1/2675/7366/files/TICH-logo_2000x.png?v=1657278272",
                caption: "The indian craft house",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Brands1 extends StatelessWidget {
  final image;
  final caption;

  const Brands1({
    Key? key,
    required this.image,
    required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(4),
          // height: 50,
          //width: 100,
          child: Column(
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image:NetworkImage(
                      image
                    )
                    ,
                    fit: BoxFit.fill,
                    width: 100,
                    height: 100,
                  ),
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
