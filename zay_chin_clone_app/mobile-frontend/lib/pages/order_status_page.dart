import 'package:clone_zay_chin/pages/home_page.dart';
import 'package:flutter/material.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({Key? key}) : super(key: key);
  static const route = '/order-status';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order status'),
            Text('Your order code O-123123'),
            Text('Order processing'),
            Text('Will arrive in 1 week'),
            ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(HomePage.route));
                },
                child: Text('Back to Home'))
          ],
        ),
      ),
    );
  }
}
