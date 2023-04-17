import 'package:final_project_funiture_app/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:final_project_funiture_app/provider/product_provider.dart';

Widget searchField(
    double width, TextEditingController searchQuery, BuildContext context) {
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
                      children: [
                        // Text(
                        //   "Search ....",
                        //   style: TextStyle(
                        //       fontSize: 15,
                        //       color: Colors.grey,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        TextField(
                          cursorColor: const Color(0xff410000),
                          style: const TextStyle(
                              // letterSpacing: 1,
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                          controller: searchQuery,
                          onSubmitted: (value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Search(query: value)));

                            // ProductProvider productProvider = ProductProvider();
                            // productProvider.searchProductsByName(value);
                          },
                          // keyboardType: TextInputType.phone,
                          // decoration: const InputDecoration(
                          //   floatingLabelBehavior: FloatingLabelBehavior.auto,
                          //   labelText: 'Search query',
                          //   labelStyle: TextStyle(
                          //       color: Color(0xff410000), fontSize: 20),
                          //   prefixIcon: Icon(
                          //     Icons.account_circle,
                          //     color: Color(0xff7c0019),
                          //     size: 30,
                          //   ),
                          //   border: InputBorder.none,
                          // ),
                        )
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
