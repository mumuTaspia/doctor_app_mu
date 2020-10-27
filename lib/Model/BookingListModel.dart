// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

List<BookingModel> bookingModelFromJson(String str) => List<BookingModel>.from(json.decode(str).map((x) => BookingModel.fromJson(x)));

String bookingModelToJson(List<BookingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingModel {
  BookingModel({
    this.id,
    this.doctorId,
    this.patientId,
    this.appointDate,
    this.problems,
    this.test,
    this.solution,
    this.advice,
    this.status,
    this.takingTime,
  });

  int id;
  int doctorId;
  int patientId;
  DateTime appointDate;
  dynamic problems;
  dynamic test;
  dynamic solution;
  dynamic advice;
  Status status;
  DateTime takingTime;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: json["id"],
    doctorId: json["doctor_id"],
    patientId: json["patient_id"],
    appointDate: DateTime.parse(json["appoint_date"]),
    problems: json["problems"],
    test: json["test"],
    solution: json["solution"],
    advice: json["advice"],
    status: statusValues.map[json["status"]],
    takingTime: DateTime.parse(json["taking_time"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "patient_id": patientId,
    "appoint_date": appointDate.toIso8601String(),
    "problems": problems,
    "test": test,
    "solution": solution,
    "advice": advice,
    "status": statusValues.reverse[status],
    "taking_time": takingTime.toIso8601String(),
  };
}

enum Status { CREATED, PENDING }

final statusValues = EnumValues({
  "Created": Status.CREATED,
  "Pending": Status.PENDING
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
