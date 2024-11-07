import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/data_sync/db/sqflite_db.dart';
import 'package:tarkari_app/features/home_screen/model/product_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Material>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Material>> {
  CartNotifier() : super([]) {
    _loadCartItems();
  }
  final LocalDatabase _localDatabase = LocalDatabase();

  Future<void> addToCart(Material material) async {
    final exists =
        state.any((item) => item.materialInfoID == material.materialInfoID);

    if (!exists) {
      state = [...state, material];
      await _localDatabase.addCartItem(material);
    }
  }

  Future<void> _loadCartItems() async {
    final items = await _localDatabase.getAllCartItems();
    state = items;
  }

  Future<void> removeFromCart(Material material) async {
    state = state
        .where((item) => item.materialInfoID != material.materialInfoID)
        .toList();
    await _localDatabase.removeCartItem(material);
  }

  Future<void> checkCartStatus() async {
    await _localDatabase.printCartItems();
  }

  Future<void> clearCart() async {
    await _localDatabase.clearCart();

    state = [];
  }

  List<Material> getCartItems() => state;
}
