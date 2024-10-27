import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tarkari_app/core/models/response/response_status.dart';
import 'package:tarkari_app/features/cart_screen/models/order_model.dart';
import 'package:tarkari_app/features/cart_screen/services/cart_service.dart';

final orderProvider = StateNotifierProvider<OrderProvider, ResponseStatus>(
  (ref) => OrderProvider(ref),
);

class OrderProvider extends StateNotifier<ResponseStatus> {
  OrderProvider(this.ref) : super(const ResponseStatus.initial());

  final Ref ref;

  Future<void> getOrderItems(CustomerOrder customerOrder) async {
    state = const ResponseStatus.progress();

    try {
      final response = await ref.read(cartService).orderItems(customerOrder);
      if (response.success) {
        state = ResponseStatus.success(data: response);
      } else {
        state = const ResponseStatus.error("Failed to Order items");
      }
    } catch (e) {
      // Handle network exceptions
      // if (e is NetworkExceptions) {
      //   state = ResponseStatus.error(e.errorMessage.toString());
      // } else {
      state = ResponseStatus.error(e.toString());
      // }
    }
  }
}
