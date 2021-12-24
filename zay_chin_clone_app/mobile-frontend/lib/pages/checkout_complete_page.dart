import 'package:clone_zay_chin/pages/home_page.dart';
import 'package:flutter/material.dart';

class CheckOutCompletePage extends StatelessWidget {
  const CheckOutCompletePage({Key? key}) : super(key: key);
  static const route = '/checkout-complete';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Thanks You For Your Order! \n ZayWal Team Will Contact To You Soon.'),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Continue to Shopping'),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}
