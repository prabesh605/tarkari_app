class ServerResponseModel {
  bool? success;
  String? message;

  ServerResponseModel({this.success = false, this.message = ''});

  Map<String, dynamic> toJson() => {'success': success, 'message': message};

  factory ServerResponseModel.fromJson(Map<String, dynamic> json) {
    return ServerResponseModel(
        success: json['Success'] as bool?, message: json['Message'] as String?);
  }
}