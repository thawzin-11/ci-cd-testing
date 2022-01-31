import 'package:admin_panel/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  final HttpLink httpLink = HttpLink(
    dotenv.env['GRAPHQL_URL'] ?? 'http://localhost:4000/graphql'
  );

  ValueNotifier<GraphQLClient> graphQLClient = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    ),
  );

  GraphQLProvider graphQLProvider = GraphQLProvider(
    child: const MyApp(),
    client: graphQLClient,
  );

  runApp(graphQLProvider);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zay-Wal Admin Panel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // home: const Center(
      //   child: Text('Zay-Wal Admin Panel Test'),
      // ),
    );
  }
}
