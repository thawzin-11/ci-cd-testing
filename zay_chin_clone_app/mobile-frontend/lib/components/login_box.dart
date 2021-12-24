import 'package:flutter/material.dart';

class LoginBox extends StatefulWidget {
  const LoginBox(
      {Key? key, required this.onLogin, required this.onPressRegister})
      : super(key: key);

  final void Function(String phNumber, String password) onLogin;
  final void Function() onPressRegister;

  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
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
              'Login',
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
                phNumber = text;
              },
              decoration: InputDecoration(
                  // labelText: 'Register with phone',
                  hintText: 'PH Number',
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
                password = text;
              },
              decoration: InputDecoration(
                  // labelText: 'Register with phone',
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            SizedBox(
              height: 60,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    widget.onLogin(phNumber, password);
                  },
                  // onPressed: () => runMutation(
                  //       {
                  //         'name': _nameController.text,
                  //         'phNumber': _phNumberController.text,
                  //         'password': "12341234",
                  //       },
                  //     ),
                  child: Text('Login')),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: widget.onPressRegister, child: Text('Register'))
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
