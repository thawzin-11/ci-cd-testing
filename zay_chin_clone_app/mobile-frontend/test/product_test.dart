import 'package:clone_zay_chin/data_models/product.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('test Prodcut', () {
    var product1 = Product(
        "111", "product1", "desc1", "kg", 1000, "img1", "cate1", "subcate1");
    var product2 =
        Product("111", "product2", "desc2", "lb", 2000, "img2", "cat2", "sub2");
    expect(product1 == product2, true);
  });
}
