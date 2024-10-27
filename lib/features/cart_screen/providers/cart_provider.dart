import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/features/home_screen/model/product_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Material>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Material>> {
  CartNotifier() : super([]);

  void addToCart(Material material) {
    final exists =
        state.any((item) => item.materialInfoID == material.materialInfoID);

    if (!exists) {
      state = [...state, material];
    }
  }

  void removeFromCart(Material material) {
    state = state
        .where((item) => item.materialInfoID != material.materialInfoID)
        .toList();
  }

  List<Material> getCartItems() => state;
}
