import 'drive_model.dart';

class Company {
  final int companyId;
  final String companyName;
  final DateTime createdAt;
  final List<Drive> drives;
  // logo

  Company({
    required this.companyId,
    required this.companyName,
    required this.createdAt,
    required this.drives,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyId: json['company_id'],
      companyName: json['company_name'],
      createdAt: DateTime.parse(json['created_at']),
      drives: List<Drive>.from(json['drives'].map((x) => Drive.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company_id': companyId,
      'company_name': companyName,
      'created_at': createdAt.toIso8601String(),
      'drives': List<dynamic>.from(drives.map((x) => x.toJson())),
    };
  }
}