// // ignore_for_file: depend_on_referenced_packages

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';

// part 'unprocessed_model.freezed.dart';
// part 'unprocessed_model.g.dart';

// UnprocessedModel unprocessedModelFromJson(String str) =>
//     UnprocessedModel.fromJson(jsonDecode(str));

// String unprocessedModelToJson(UnprocessedModel data) =>
//     json.encode(data.toJson());

// @freezed
// class UnprocessedModel with _$UnprocessedModel {
//   const factory UnprocessedModel({
//     @Default('') String? message,
//     Errors? errors,
//   }) = _UnprocessedModel;

//   factory UnprocessedModel.fromJson(Map<String, dynamic> json) =>
//       _$UnprocessedModelFromJson(json);
// }

// @freezed
// abstract class Errors with _$Errors {
//   const factory Errors({
//     @Default([]) List<String>? name,
//     @Default([]) List<String>? email,
//     @Default([]) List<String>? password,
//     @Default([]) List<String>? phone,
//   }) = _Errors;

//   factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
// }
