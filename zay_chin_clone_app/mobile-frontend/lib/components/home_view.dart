import 'package:clone_zay_chin/data_models/category.dart';
import 'package:clone_zay_chin/components/item_row.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoriesQuery = """
      query Query {
        categories {
          name
          products {
            _id
            name
            description
            priceUnit
            price
            image
            category
            subcategory
          }
        }
      }
    """;

    return Query(
        options: QueryOptions(document: gql(categoriesQuery)),
        builder: (QueryResult queryResult, {refetch, fetchMore}) {
          //todo: add UI

          //Show Loading UI when loading
          if (queryResult.isLoading) {
            return Text('Loading');
          }

          //Show actual data when success
          if (queryResult.source != null) {
            print("queryResult=");
            print("queryResult.data");
            // print(queryResult.data?["categories"]);

            List resultList = queryResult.data?["categories"];

            List<Category> categories = resultList
                .map((eachCategory) => Category.fromJson(eachCategory))
                .toList();

            return ProductsFeed(
              categories: categories,
            );
          }

          //this code should not be reached
          return Text('unexpected');
        });
  }
}

class ProductsFeed extends StatelessWidget {
  final List<Category> categories;
  const ProductsFeed({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> itemRows = [];
    categories.forEach((category) {
      itemRows.add(
          ItemRow(categoryName: category.name, products: category.products));
    });

    return Scaffold(
      body: ListView(children: itemRows),
    );
  }
}
