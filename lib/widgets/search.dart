import 'package:flutter/material.dart';

Widget searchField() {
  return Expanded(
    child: Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.03),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
      child: Row(
        children: [
          const SizedBox(width: 5,),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xff80221e),
              borderRadius: BorderRadius.circular(15),
              // shape: BoxShape.circle
            ),
            child: const Center(child: Icon(Icons.search_rounded)),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    ),
  );
}
