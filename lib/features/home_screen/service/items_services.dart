import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/models/services/network/base_client.dart';

import 'package:tarkari_app/features/home_screen/model/product_model.dart';

final itemsService = Provider((ref) => ItemsService());

class ItemsService {
  Future<ProductResponse> getItems() async {
    try {
      final response = await BaseClient.instance.get(
        ApiConstants.getMaterialItems,
      );
      return ProductResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
