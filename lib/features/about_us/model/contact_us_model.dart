// class ContactUs {
//   Cuvm cuvm;

//   ContactUs({
//     required this.cuvm,
//   });
// }

// class Cuvm {
//   int contactId;
//   String fullName;
//   String email;
//   String phoneNumber;
//   String subject;
//   String message;

//   Cuvm({
//     required this.contactId,
//     required this.fullName,
//     required this.email,
//     required this.phoneNumber,
//     required this.subject,
//     required this.message,
//   });
// }
// To parse this JSON data, do
//
//     final contactUs = contactUsFromJson(jsonString);

import 'dart:convert';

ContactUs contactUsFromJson(String str) => ContactUs.fromJson(json.decode(str));

String contactUsToJson(ContactUs data) => json.encode(data.toJson());

class ContactUs {
  Cuvm cuvm;

  ContactUs({
    required this.cuvm,
  });

  factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
        cuvm: Cuvm.fromJson(json["cuvm"]),
      );

  Map<String, dynamic> toJson() => {
        "cuvm": cuvm.toJson(),
      };
}

class Cuvm {
  int contactId;
  String fullName;
  String email;
  String phoneNumber;
  String subject;
  String message;

  Cuvm({
    required this.contactId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.subject,
    required this.message,
  });

  factory Cuvm.fromJson(Map<String, dynamic> json) => Cuvm(
        contactId: json["contactID"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        subject: json["subject"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "contactID": contactId,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "subject": subject,
        "message": message,
      };
}
