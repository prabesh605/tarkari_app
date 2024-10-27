import 'package:hooks_riverpod/hooks_riverpod.dart'; // You only need hooks_riverpod here
import 'package:tarkari_app/core/constants/storage_constants.dart';
import 'package:tarkari_app/core/models/response/response_status.dart';
import 'package:tarkari_app/core/models/services/storage/sharedpref_helper.dart';
import 'package:tarkari_app/features/auth/model/request/login_request_model.dart';
import 'package:tarkari_app/features/auth/service/auth_service.dart';

final loginProvider = StateNotifierProvider<LoginProvider, ResponseStatus>(
  (ref) => LoginProvider(ref),
);

class LoginProvider extends StateNotifier<ResponseStatus> {
  LoginProvider(this.ref) : super(const ResponseStatus.initial());

  final Ref ref;

  Future<void> login(
      {required String username, required String password}) async {
    state = const ResponseStatus.progress();

    try {
      final response = await ref.read(authService).login(
            loginRequestModel: LoginRequestModel(
              username: username,
              password: password,
            ),
          );

      // Save token if the response is successful
      if (response.data.accessToken != null) {
        await SharedPrefHelper.writeString(
          StorageConstant.token,
          response.data.accessToken,
        );
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
