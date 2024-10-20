import 'package:equatable/equatable.dart';

class ErrorMessageModelmovie extends Equatable {
  final int statuscode;
  final String statusmessage;
  final bool success;

  const ErrorMessageModelmovie(
      {required this.statuscode,
      required this.statusmessage,
      required this.success});

  @override
  List<Object?> get props => [statuscode, statusmessage, success];

  factory ErrorMessageModelmovie.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModelmovie(
        statuscode: json["status_code"],
        statusmessage: json["status_message"],
        success: json["success"]);
  }
}
