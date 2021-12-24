import 'package:flutter/material.dart';

class RegisterBox extends StatefulWidget {
  const RegisterBox(
      {Key? key, required this.onRegister, required this.onPressLogin})
      : super(key: key);

  final void Function(String name, String phNumber, String password) onRegister;
  final void Function() onPressLogin;

  @override
  _RegisterBoxState createState() => _RegisterBoxState();
}

class _RegisterBoxState extends State<RegisterBox> {
  var name = '';
  var phNumber = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register Here !',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              // showCursor: true,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20),
              onChanged: (text) {
                name = text;
              },
              decoration: InputDecoration(
                  // labelText: 'Register with phone',
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // showCursor: true,
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 20),
              onChanged: (text) {
                phNumber = text;
              },
              decoration: InputDecoration(
                  // labelText: 'Register with phone',
                  hintText: 'Phone Number (09)',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            SizedBox(
              height: 60,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    widget.onRegister(name, phNumber, password);
                  },
                  // onPressed: () => runMutation(
                  //       {
                  //         'name': _nameController.text,
                  //         'phNumber': _phNumberController.text,
                  //         'password': "12341234",
                  //       },
                  //     ),
                  child: Text('Register')),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: widget.onPressLogin, child: Text('Login'))
            ]),
            // style: ElevatedButton.styleFrom(
            //     fixedSize: Size(350, 50),
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20)))),
          ],
        ),
      ),
    );
  }
}
