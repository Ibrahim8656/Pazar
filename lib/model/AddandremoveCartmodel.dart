class ChangeingCartemodle {
  bool status;
  String message;

  ChangeingCartemodle({
    required this.status,
    required this.message,
  });

  factory ChangeingCartemodle.fromJson(Map<String, dynamic> json) {
    return ChangeingCartemodle(
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
