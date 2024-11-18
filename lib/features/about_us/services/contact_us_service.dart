import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/models/services/network/base_client.dart';
import 'package:tarkari_app/features/about_us/model/contact_us_model.dart';

final contactUsService = Provider((ref) => ContactUsService());

class ContactUsService {
  Future contactService({required ContactUs contactUS}) async {
    try {
      final response = await BaseClient.instance.post(
        ApiConstants.contactUs,
        data: contactUS,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
