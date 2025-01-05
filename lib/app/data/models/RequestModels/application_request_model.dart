class ApplicationRequest {
  String studentId;
  String driveId;

  ApplicationRequest({
    required this.studentId,
    required this.driveId,
  });

  factory ApplicationRequest.fromJson(Map<String, dynamic> json) =>
      ApplicationRequest(
        studentId: json["studentId"],
        driveId: json["driveId"],
      );

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "driveId": driveId,
      };
}
