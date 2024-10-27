import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/models/services/network/base_client.dart';
import 'package:tarkari_app/features/auth/model/request/login_request_model.dart';
import 'package:tarkari_app/features/auth/model/response/response_model.dart';

final authService = Provider((ref) => AuthService());

class AuthService {
  Future<TokenModel> login(
      {required LoginRequestModel loginRequestModel}) async {
    try {
      final response = await BaseClient.instance.post(
        ApiConstants.authenticateLogin,
        data: loginRequestModel.toJson(),
      );
      return TokenModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
