class OrderResponse {
  bool success;
  String message;
  dynamic data;

  OrderResponse({
    required this.success,
    required this.message,
    required this.data,
  });
  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
}
