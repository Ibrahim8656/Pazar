class UserModel {
  final bool status;
  final String message;
  final UserData? data; // Allow data to be null

  UserModel({
    required this.status,
    required this.message,
    this.data, // data can be null
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status'] ?? false, // Default to false if not provided
      message: json['message'] ?? '', // Default to empty string if not provided
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: json['credit'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'points': points,
      'credit': credit,
      'token': token,
    };
  }
}

class RegisterModel {
  final bool status;
  final String message;
  final RegisterData? data;

  RegisterModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      // Check if 'data' is null or if it's a valid map, otherwise set data to null
      data: json['data'] != null && json['data'] is Map<String, dynamic>
          ? RegisterData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class RegisterData {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String image;

  RegisterData({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
    };
  }
}
