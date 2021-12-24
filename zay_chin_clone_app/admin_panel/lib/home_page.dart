import 'package:admin_panel/models/order.dart';
import 'package:admin_panel/order_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String orderQuery = """
        query Query {
          orders {
            status
            customerName
            deliveryPhNumber
            address {
              houseOrApartmentNo
              streetNo
              quarter
              township
              city
            }
            deliveryDate
            paymentMethod
            promoCode
            note
            products {
              productId
              name
              description
              priceUnit
              price
              image
              qty
            }
          }
        }
      """;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: Query(
        options: QueryOptions(document: gql(orderQuery)),
        builder: (QueryResult result, {refetch, fetchMore}) {
          if (result.isLoading) {
            return const Center(
              child: Text('Loading'),
            );
          }

          if (result.source != null) {
            List resultLists = result.data?['orders'];
            List<Order> orderLists =
                resultLists.map((each) => Order.fromJson(each)).toList();

            // print(result);
            return OrderPage(
              orders: orderLists,
            );
          }
          return const Text('Dummy');
        },
      ),
    );
  }
}
