import 'package:hive/hive.dart';
import '../models/product.dart';

class CartService {
  final Box cart = Hive.box("cart");

  void add(Product product) {
    final item = cart.get(product.id);

    if (item == null) {
      cart.put(product.id, {
        'name': product.name,
        'image': product.image,
        'price': product.price,
        'qty': 1,
      });
    } else {
      item['qty']++;
      cart.put(product.id, item);
    }
  }

  void decrease(String id) {
    final item = cart.get(id);
    if (item == null) return;

    if (item['qty'] > 1) {
      item['qty']--;
      cart.put(id, item);
    } else {
      cart.delete(id);
    }
  }

  List<Map> all() => cart.values.cast<Map>().toList();

  double total() {
    return all()
        .fold(0, (sum, item) => sum + (item['price'] * item['qty']));
  }
}