
import '../../provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_model.dart';
import '../../models/order_model.dart';

OrderProvider provider = OrderProvider();
class ResultOrder extends StatefulWidget {
  const ResultOrder({super.key, required this.order, required this.listCart});
  final OrderModel order;
  final List<Cart> listCart;


  @override
  State<ResultOrder> createState() => _ResultOrderState();
}

class _ResultOrderState extends State<ResultOrder> {

  int i = 0;
  @override
  void inintState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<OrderProvider>(context);

    print(widget.order.fullName);

    if (i == 0) {
      setState(() {
        provider.addOrder(widget.order, widget.listCart);
        i += 1;
      });
    }

    if(provider.addCartSucc == true) {
      return Scaffold(
        body: Center(
          child: Column(
            children: const [
              Image(image: AssetImage("assets/icons/success.png")),
              Text('Order Sucessfull'),
            ],
          ),
        ),
      );
    }
    else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}