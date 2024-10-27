import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tarkari_app/core/models/response/response_status.dart';

import 'package:tarkari_app/features/home_screen/service/items_services.dart';

final itemsProvider = StateNotifierProvider<ItemsProvider, ResponseStatus>(
  (ref) => ItemsProvider(ref),
);

class ItemsProvider extends StateNotifier<ResponseStatus> {
  ItemsProvider(this.ref) : super(const ResponseStatus.initial());

  final Ref ref;

  Future<void> getItemsData() async {
    state = const ResponseStatus.progress();

    try {
      final response = await ref.read(itemsService).getItems();
      if (response.success) {
        state = ResponseStatus.success(data: response);
      } else {
        state = const ResponseStatus.error("Failed to fetch access token");
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
