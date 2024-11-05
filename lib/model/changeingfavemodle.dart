class Changeingfavemodle {
  bool status;
  String message;

  Changeingfavemodle({
    required this.status,
    required this.message,
  });

  factory Changeingfavemodle.fromJson(Map<String, dynamic> json) {
    return Changeingfavemodle(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
