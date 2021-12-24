import 'package:admin_panel/home_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  final HttpLink httpLink = HttpLink(
    'http://localhost:4000/graphql',
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
      title: 'Zay-Wal Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
