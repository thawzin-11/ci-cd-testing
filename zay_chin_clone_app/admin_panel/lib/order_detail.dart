import 'package:admin_panel/models/product.dart';
import 'package:admin_panel/models/user.dart';
import 'package:admin_panel/models/address.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  final List<Product> products;
  // final User user;
  final Address address;
  const OrderDetail({Key? key, required this.products, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataRow> listsOfDataRow = products.map(
      (product) {
        return DataRow(
          cells: [
            // const DataCell(Text('null')),
            DataCell(
              Text(product.name),
            ),
            DataCell(
              Text(product.priceUnit),
            ),
            DataCell(
              Text(
                product.price.toString(),
              ),
            ),
            DataCell(
              Text(address.streetNo),
            ),
            DataCell(
              Text(address.township),
            ),
          ],
        );
      },
    ).toList();

    int _getTotalAmt() {
      int value = 0;
      for (var element in products) {
        value += element.price;
      }
      return value;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: Row(
        children: [
          Drawer(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text('Dashboard'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('Orders'),
                  onTap: () {},
                )
              ],
            ),
          ),
          const VerticalDivider(
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('Product Name'),
                    ),
                    DataColumn(
                      label: Text('PriceUnit'),
                    ),
                    DataColumn(
                      label: Text('Price'),
                    ),
                    DataColumn(
                      label: Text('Street No'),
                    ),
                    DataColumn(
                      label: Text('Township'),
                    ),
                  ],
                  rows: listsOfDataRow,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        Text('Subtotal'),
                        Text('Shipping & Handling'),
                        Text('Discount'),
                        Text('Tax')
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(_getTotalAmt().toString() + ' MMK'),
                        const Text('0 MMK'),
                        const Text('0 MMK'),
                        const Text('150 MMK')
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
