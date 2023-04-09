import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project_funiture_app/widgets/bottom_navy_bar.dart';
import 'package:final_project_funiture_app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../provider/product_provider.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.productID});
  final String productID;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

ProductProvider productProvider = ProductProvider();

final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

void getCallAllFunction(String id) {
  productProvider.getProductItem(id);
  productProvider.getProductbyID(id);
}

class _ProductDetailPageState extends State<ProductDetailPage> {


  late String imageMainCurrent;
  int i = 0;
  late String activeItem = '';
  late ProductItem productItem;

  @override
  void initState() {
    getCallAllFunction(widget.productID);
    super.initState();
  }

  bool setActiveColor(String itemID) {
    if (itemID == activeItem) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction(widget.productID);

    return Scaffold(
      key: _key,
      backgroundColor: const Color(0xfff2f9fe),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const AutoSizeText(
          'Product detail',
          maxFontSize: 17,
          minFontSize: 12,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  getImage(productProvider.getListProductItem,
                      productProvider.getProductCurrent),
                  getInfor(productProvider.getProductCurrent),
                ],
              )),
        ),
      ),
      bottomNavigationBar: getBottomBar(),
    );
  }

  Widget getImage(List<ProductItem> productItemList, Product productCurrent) {
    if (productItemList.isNotEmpty && productCurrent.color != '') {
      ProductItem productItem = productItemList[0];
      if (i == 0) {
        imageMainCurrent = productCurrent.img;
        activeItem = productItemList[0].id;
        productItem = productItemList[0];
        i++;
      }
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 4,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                height: 300,
                child: ListView.builder(
                    itemCount: productItem.img.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          behavior: HitTestBehavior.deferToChild,
                          onTap: () {
                            setState(() {
                              imageMainCurrent = productItem.img[index];
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Image(
                              image: NetworkImage(productItem.img[index]),
                              fit: BoxFit.fill,
                            ),
                          ));
                    }),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                width: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width / 4,
                height: 300,
                child: Image(
                  image: NetworkImage(imageMainCurrent),
                  fit: BoxFit.fill,
                  key: ValueKey(DateTime.now().toString()),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: -1,
                direction: Axis.vertical,
                children: productItemList
                    .map(
                      (element) => Stack(
                        children: [
                          Visibility(
                            visible: setActiveColor(element.id),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                productItem = element;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(13.5),
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: HexColor.fromHex(productCurrent.color),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      );
    } else {
      return const SizedBox(
        height: 400,
      );
    }
  }

  Widget getInfor(Product productCurrent) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Text(productCurrent.name,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(getDecorPrice(productCurrent.currentPrice),style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
        ),
        Row(
          children: const [
            SizedBox(width: 10,),
            Icon(Icons.star , color: Colors.yellow,),
            Icon(Icons.star , color: Colors.yellow,),
            Icon(Icons.star , color: Colors.yellow,),
            Icon(Icons.star , color: Colors.yellow,),
            Icon(Icons.star , color: Colors.yellow,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: const Text('Description',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Text(productCurrent.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),),
            ),
          ],
        )
      ],
    );
  }

  Widget getBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xff80221e),
      selectedFontSize: 20,
      elevation: 0.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(
        color: Color(0xff80221e),
      ),
      backgroundColor: const Color(0x00ffffff),
      items: bottomNavigationItems,
      onTap: (selectedItem) => itemClick(selectedItem, context),
    );
  }
}

var bottomNavigationItems = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(
      Icons.threed_rotation_outlined,
      color: Colors.black,
    ),
    label: "3D",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(Icons.screenshot_outlined, color: Colors.black),
    label: "AR",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(Icons.add_shopping_cart_outlined, color: Colors.black),
    label: "Cart",
  ),
];