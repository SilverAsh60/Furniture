import 'package:flutter/material.dart';

Widget searchField(double width) {
  return Row(
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(
            top: 0,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.03),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ]),
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xff80221e),
                  borderRadius: BorderRadius.circular(20),
                  // shape: BoxShape.circle
                ),
                child: const Center(child: Icon(Icons.search_rounded)),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  width: (width - 90) * 0.7,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Search ....",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.tune,
                        color: Color(0xff80221e),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
