import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';
Widget getCategoryList(List<Category> categoryList) {
  return Container(
    margin: const EdgeInsets.all(10),
    height: 100,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: -1,
        direction: Axis.vertical,
        children: categoryList
            .map(
              (element) => Container(
            // margin: EdgeInsets.symmetric(horizontal: 5),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(179, 213, 242, 0.2),
                  spreadRadius: 5,
                  blurRadius: 3,
                ),
              ],
            ),
            margin: const EdgeInsets.all(7),
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: NetworkImage(element.img),width: 50,height: 50,),
                const SizedBox(height: 5,),
                AutoSizeText(
                  element.name,
                  maxFontSize: 15,
                  minFontSize: 12,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        )
            .toList(),
      ),
    ),
  );
}