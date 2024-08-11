/*import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';



class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MyHomeScreen()
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Image Slider Demo"),),
      body: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          constraints: const BoxConstraints.expand(
              height: 225
          ),
          child: imageSlider(context)),
    );
  }
}

Swiper imageSlider(context){
  return Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return Image.network(
        "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
        fit: BoxFit.fitHeight,
      );
    },
    itemCount: 10,
    viewportFraction: 0.7,
    scale: 0.8,
  );
}
*/