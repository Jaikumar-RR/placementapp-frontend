import 'application_model.dart';

class Status {
  final int statusId;
  final String status;
  final String? description;
  final List<Application> applications;

  Status({
    required this.statusId,
    required this.status,
    this.description,
    required this.applications,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      statusId: json['status_id'],
      status: json['status'],
      description: json['description'],
      applications: List<Application>.from(json['applications'].map((x) => Application.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status_id': statusId,
      'status': status,
      'description': description,
      'applications': List<dynamic>.from(applications.map((x) => x.toJson())),
    };
  }
}