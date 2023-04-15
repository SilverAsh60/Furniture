import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});


  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<String> listBanner = [
    "assets/images/logo.png",
    "assets/images/logo.png",
    "assets/images/logo.png",
    "assets/images/logo.png",
  ];

  /*getBanner() async {
    return await firestore.collection("banner").get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          listBanner.add(doc['imgURL'].toString());
        });
      }
    });
  }*/

  @override
  void initState() {
    //getBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (listBanner.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.only(top: 10),
        child: FanCarouselImageSlider(
          imagesLink: listBanner,
          isAssets: true,
          sliderHeight: 244,
          sliderWidth: 430,
          sidesOpacity: 0.3,
          imageFitMode: BoxFit.fill,
          imageRadius: 10,
          sliderDuration: const Duration(seconds: 1),
          autoPlayInterval: const Duration(seconds: 4),
          indicatorActiveColor: const Color(0xff80221e),
          indicatorDeactiveColor: const Color(0xffb85c48),
          isClickable: false,
        ),
      );
    }
    else {
      return Container();
    }
  }
}