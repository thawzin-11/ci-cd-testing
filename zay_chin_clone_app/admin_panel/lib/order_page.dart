import 'package:admin_panel/models/address.dart';
import 'package:admin_panel/models/order.dart';
import 'package:admin_panel/models/product.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final List<Order> orders;
  const OrderPage({Key? key, required this.orders}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedIndex = 0;
  List<Product> products = [];
  late Address address;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          child: selectedIndex == 0
              ? _buildDataTable(_buildOrderDataRow)
              : Column(
                  children: [
                    _builElevatedButton(),
                    _buildDataTable(_buildOrderDataRow),
                    const SizedBox(
                      height: 30,
                    ),
                    _buildRow()
                  ],
                ),
        ),
      ],
    );
  }

  List<DataRow> _buildOrderDataRow() {
    List<DataRow> listsOfDataRow = widget.orders.map(
      (order) {
        return DataRow(
          cells: [
            const DataCell(
              Text("11111"),
            ),
            DataCell(
              Text(order.status),
            ),
            DataCell(
              Text(order.customerName),
            ),
            DataCell(
              Text(order.deliveryPhNumber),
            ),
            DataCell(
              Text(order.deliveryDate),
            ),
            DataCell(
              Text(order.paymentMethod),
            ),
            DataCell(
              Text(order.promoCode ?? "Null"),
            ),
            DataCell(
              Text(order.note ?? "Null"),
            ),
            DataCell(
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex++;
                    products = order.products;
                    address = order.address;
                  });
                },
                child: const Text('View'),
              ),
            ),
          ],
        );
      },
    ).toList();
    return listsOfDataRow;
  }

  DataTable _buildDataTable(List<DataRow> Function() _buildOrderDataRow) {
    return DataTable(
      columns: selectedIndex == 0
          ? _buildOrderDataColumn()
          : _buildOrderDetailDataColumn(),
      rows: selectedIndex == 0
          ? _buildOrderDataRow()
          : _buildOrderDetailDataRow(products, address),
    );
  }

  Row _builElevatedButton() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          child: const Text("Back"),
        )
      ],
    );
  }

  List<DataColumn> _buildOrderDataColumn() {
    return const [
      DataColumn(
        label: Text('ID'),
      ),
      DataColumn(
        label: Text('Status'),
      ),
      DataColumn(
        label: Text('Customer Name'),
      ),
      DataColumn(
        label: Text('Delivery PhNumber'),
      ),
      DataColumn(
        label: Text('Delivery Date'),
      ),
      DataColumn(
        label: Text('Payment Method'),
      ),
      DataColumn(
        label: Text('Promo Code'),
      ),
      DataColumn(
        label: Text('Note'),
      ),
      DataColumn(
        label: Text('Actions'),
      ),
    ];
  }

  List<DataColumn> _buildOrderDetailDataColumn() {
    return const [
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
    ];
  }

  List<DataRow> _buildOrderDetailDataRow(
      List<Product> products, Address address) {
    List<DataRow> listsOfDataRow = products.map(
      (product) {
        return DataRow(
          cells: [
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
    return listsOfDataRow;
  }

  Row _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  int _getTotalAmt() {
    int value = 0;
    for (var element in products) {
      value += element.price;
    }
    return value;
  }
}
