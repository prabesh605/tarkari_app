class ContactUs {
  Cuvm cuvm;

  ContactUs({
    required this.cuvm,
  });
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
}
