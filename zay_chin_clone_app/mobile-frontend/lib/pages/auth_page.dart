import 'package:clone_zay_chin/components/login_box.dart';
import 'package:clone_zay_chin/components/register_box.dart';
import 'package:clone_zay_chin/pages/order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  static const route = '/auth';

  @override
  _AuthPageState createState() => _AuthPageState();
}

enum AuthMode { Register, Login }

class _AuthPageState extends State<AuthPage> {
  AuthMode _authMode = AuthMode.Login;
  @override
  Widget build(BuildContext context) {
    String addUser = """
      mutation Mutation(\$name: String!, \$phNumber: String!, \$password: String!) {
        register(name: \$name, phNumber: \$phNumber, password: \$password) {
          success
          token
          user {
            _id
            name
            password
          }
        }
      }
    """;

    // Future<void> saveSession(SessionData sessionData) async {
    //   await FlutterSession().set('sessionData', sessionData);
    // }

    return Scaffold(
      appBar: AppBar(),
      body: Mutation(
        options: MutationOptions(
          document: gql(addUser),
          update: (GraphQLDataProxy cache, result) {
            return cache;
          },
          onCompleted: (dynamic resultData) {
            print('onCompleted');

            print(resultData);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (Context) => OrderDetailPage()));
          },
        ),
        builder: (RunMutation runMutation, result) {
          // print("result=");
          // print(result);
          if (_authMode == AuthMode.Register) {
            return RegisterBox(
              onRegister: (String name, String phNumber, String password) {
                print('onregister');
              },
              onPressLogin: () {
                setState(() {
                  _authMode = AuthMode.Login;
                });
              },
            );
          } else {
            return LoginBox(
              onLogin: (String phNumber, String password) {
                Navigator.pushNamed(context, OrderDetailPage.route);
                print('onLogin');
              },
              onPressRegister: () {
                setState(() {
                  _authMode = AuthMode.Register;
                });
              },
            );
          }
        },
      ),
    );
  }
}
