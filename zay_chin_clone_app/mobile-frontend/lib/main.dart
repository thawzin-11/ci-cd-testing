import 'package:clone_zay_chin/pages/auth_page.dart';
import 'package:clone_zay_chin/pages/cart_page.dart';
import 'package:clone_zay_chin/pages/checkout_complete_page.dart';
import 'package:clone_zay_chin/pages/checkout_page.dart';
import 'package:clone_zay_chin/pages/home_page.dart';
import 'package:clone_zay_chin/pages/order_detail_page.dart';
import 'package:clone_zay_chin/pages/order_finished_page.dart';
import 'package:clone_zay_chin/pages/order_status_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:clone_zay_chin/data_models/store.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  final HttpLink httpLink =
      HttpLink(dotenv.env['GRAPH_URL'] ?? "http://localhost:4000/graphql");

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
      link: httpLink, cache: GraphQLCache(store: InMemoryStore())));
  var app = ChangeNotifierProvider(
    create: (context) => StoreModel(),
    child: GraphQLProvider(
      client: client,
      child: MyApp(),
    ),
  );

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zay Wal',
      theme: ThemeData(
        primaryColor: Color(0xFFEAEDEF),
        // scaffoldBackgroundColor: Color(0xFFEFEFD0))
        // primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        AuthPage.route: (context) => AuthPage(),
        CartPage.route: (context) => CartPage(),
        CheckOutCompletePage.route: (context) => CheckOutCompletePage(),
        CheckOutPage.route: (context) => CheckOutPage(),
        OrderDetailPage.route: (context) => OrderDetailPage(),
        OrderFinishedPage.route: (context) => OrderFinishedPage(),
        OrderStatusPage.route: (context) => OrderStatusPage(),
      },
    );
  }
}
