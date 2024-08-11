/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageSwiper extends StatefulWidget {
  @override
  ImageSwiperState createState() => ImageSwiperState();
}

class ImageSwiperState extends State<ImageSwiper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      //margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      constraints: const BoxConstraints.expand(height: 225, width: 450),
      decoration: BoxDecoration(
          color: Colors.amber.shade300,
          borderRadius: BorderRadius.circular(50)),
      child: imageSlider(context),
    );
  }
}

Swiper imageSlider(context) {
  final imageList = [
    "cubism.jpeg",
    "wall_painting.jpeg",
    "digital.jpeg",
    "draw.jpeg",
    "sculpture.jpeg",
  ];
  return Swiper(
    scrollDirection: Axis.horizontal,
    pagination: const SwiperPagination(
      builder: DotSwiperPaginationBuilder(
        color: Colors.grey,
      ),
    ),
    autoplay: true,
    curve: Curves.fastOutSlowIn,
    duration: 1000,
    itemBuilder: (BuildContext context, int index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          imageList[index],
          fit: BoxFit.fill,
          width: 450,
          height: 225,
        ),
      );
    },
    itemCount: 5,
    viewportFraction: 1,
    scale: 0.8,
  );
}
*/