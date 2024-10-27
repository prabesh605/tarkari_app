import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/models/services/network/base_client.dart';
import 'package:tarkari_app/features/cart_screen/models/order_model.dart';
import 'package:tarkari_app/features/cart_screen/models/order_response_model.dart';

final cartService = Provider((ref) => CartService());

class CartService {
  Future<OrderResponse> orderItems(CustomerOrder customerOrder) async {
    try {
      final response = await BaseClient.instance
          .post(ApiConstants.orderInfoMaster, data: customerOrder);
      return OrderResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
