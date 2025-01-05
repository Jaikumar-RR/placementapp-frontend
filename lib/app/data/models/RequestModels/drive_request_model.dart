class DriveRequest {
  final int? driveId; // Nullable for new instances before creation
  final int companyId;
  final String jobRole;
  final String? location;
  final String? description;
  final String? salary;
  final String? trainingPeriod;
  final String? trainingStipend;
  final DateTime? driveDate;
  final String? driveTime;
  final int? eligible10thMark;
  final int? eligible12thMark;
  final double? eligibleCgpa;
  final int? eligibleHistoryOfArrears;
  final int? eligibleCurrentArrears;
  final String? jobType;
  final List<String>? requiredSkills; // Nullable list of strings
  final DateTime? createdAt;

  DriveRequest({
    this.driveId,
    required this.companyId,
    required this.jobRole,
    this.location,
    this.description,
    this.salary,
    this.trainingPeriod,
    this.trainingStipend,
    this.driveDate,
    this.driveTime,
    this.eligible10thMark,
    this.eligible12thMark,
    this.eligibleCgpa,
    this.eligibleHistoryOfArrears,
    this.eligibleCurrentArrears,
    this.jobType,
    this.requiredSkills,
    this.createdAt,
  });

  // Factory constructor for creating an instance from JSON
  factory DriveRequest.fromJson(Map<String, dynamic> json) {
    return DriveRequest(
      driveId: json['drive_id'],
      companyId: json['company_id'],
      jobRole: json['job_role'],
      location: json['location'],
      description: json['description'],
      salary: json['salary'],
      trainingPeriod: json['training_period'],
      trainingStipend: json['training_stipend'],
      driveDate: json['drive_date'] != null
          ? DateTime.parse(json['drive_date'])
          : null,
      driveTime: json['drive_time'],
      eligible10thMark: json['eligible_10th_mark'],
      eligible12thMark: json['eligible_12th_mark'],
      eligibleCgpa: (json['eligible_cgpa'] as num?)?.toDouble(),
      eligibleHistoryOfArrears: json['eligible_history_of_arrears'],
      eligibleCurrentArrears: json['eligible_current_arrears'],
      jobType: json['job_type'],
      requiredSkills: (json['required_skills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  // Method for converting an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'drive_id': driveId,
      'company_id': companyId,
      'job_role': jobRole,
      'location': location,
      'description': description,
      'salary': salary,
      'training_period': trainingPeriod,
      'training_stipend': trainingStipend,
      'drive_date': driveDate?.toIso8601String(),
      'drive_time': driveTime,
      'eligible_10th_mark': eligible10thMark,
      'eligible_12th_mark': eligible12thMark,
      'eligible_cgpa': eligibleCgpa,
      'eligible_history_of_arrears': eligibleHistoryOfArrears,
      'eligible_current_arrears': eligibleCurrentArrears,
      'job_type': jobType,
      'required_skills': requiredSkills,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
