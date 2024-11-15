import 'package:hooks_riverpod/hooks_riverpod.dart'; // You only need hooks_riverpod here
import 'package:tarkari_app/core/models/response/response_status.dart';
import 'package:tarkari_app/features/about_us/model/contact_us_model.dart';
import 'package:tarkari_app/features/about_us/services/contact_us_service.dart';

final contactUsProvider =
    StateNotifierProvider<ContactUsProvider, ResponseStatus>(
  (ref) => ContactUsProvider(ref),
);

class ContactUsProvider extends StateNotifier<ResponseStatus> {
  ContactUsProvider(this.ref) : super(const ResponseStatus.initial());

  final Ref ref;

  Future<void> contactUsProvider(
      {required String fullName,
      required String email,
      required String phoneNumber,
      required String subject,
      required String message}) async {
    state = const ResponseStatus.progress();

    try {
      final response = await ref.read(contactUsService).contactService(
              contactUS: ContactUs(
            cuvm: Cuvm(
                contactId: 0,
                fullName: fullName,
                email: email,
                phoneNumber: phoneNumber,
                subject: subject,
                message: message),
          ));

      state = ResponseStatus.success(data: response);
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
