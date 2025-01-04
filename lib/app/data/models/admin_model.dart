import 'user_model.dart';

class Admin {
  final int adminId;
  final int userId;
  final String name;
  final String? profileUrl;
  final String? phoneNumber;
  final String? email;
  final DateTime createdAt;
  final User user;

  Admin({
    required this.adminId,
    required this.userId,
    required this.name,
    this.profileUrl,
    this.phoneNumber,
    this.email,
    required this.createdAt,
    required this.user,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        adminId: json['admin_id'],
        userId: json['user_id'],
        phoneNumber: json['phone_number'],
        email: json['email'],
        createdAt: DateTime.parse(json['created_at']),
        user: User.fromJson(json['user']),
        name: json['name'],
        profileUrl: json['profileUrl']);
  }

  Map<String, dynamic> toJson() {
    return {
      'admin_id': adminId,
      'user_id': userId,
      'phone_number': phoneNumber,
      'email': email,
      'created_at': createdAt.toIso8601String(),
      'user': user.toJson(),
    };
  }
}
