import 'package:clone_zay_chin/components/category_of_item.dart';
import 'package:clone_zay_chin/data_models/category.dart';
import 'package:clone_zay_chin/data_models/product.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var query = """
      query Query {
        categories {
          name
          products {
            id
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
        options: QueryOptions(document: gql(query)),
        builder: (QueryResult result, {refetch, fetchMore}) {
          List resultList = result.data?["categories"];

          List<Category> categories = resultList
              .map((eachCategory) => Category.fromJson(eachCategory))
              .toList();
          return CategoriesUI(categories: categories);
        });
  }
}

class CategoriesUI extends StatelessWidget {
  final List<Category> categories;
  const CategoriesUI({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> expansionTiles = [];

    categories.forEach((category) {
      List<Widget> listTiles = [];

      List<Product> listOfProducts = category.products;
      Product firstProductOnly = listOfProducts.elementAt(0);

      listTiles.add(ListTile(
        subtitle: Text(firstProductOnly.subcategory),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryOfItem(
                        productLists: listOfProducts,
                      )));
        },
      ));
      // .map((product) => ListTile(
      //       subtitle: Text(product.subcategory),
      //       onTap: () {
      //         // new widget
      //         // categories,
      //       },
      //     ))
      // .toList();

      expansionTiles
          .add(ExpansionTile(title: Text(category.name), children: listTiles));
    });
    return Scaffold(
      body: ListView(
        children: expansionTiles,
      ),
    );
  }
}
