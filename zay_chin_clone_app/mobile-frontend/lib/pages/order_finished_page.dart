import 'package:clone_zay_chin/pages/order_status_page.dart';
import 'package:flutter/material.dart';

class OrderFinishedPage extends StatelessWidget {
  const OrderFinishedPage({Key? key}) : super(key: key);
  static const route = '/order-finish';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Thank You for order'),
            ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text('Continue Shopping')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, OrderStatusPage.route);
                },
                child: Text('Check order status'))
          ],
        ),
      ),
    );
  }
}
