// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'unprocessed_model.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// _$UnprocessedModelImpl _$$UnprocessedModelImplFromJson(
//         Map<String, dynamic> json) =>
//     _$UnprocessedModelImpl(
//       message: json['message'] as String? ?? '',
//       errors: json['errors'] == null
//           ? null
//           : Errors.fromJson(json['errors'] as Map<String, dynamic>),
//     );

// Map<String, dynamic> _$$UnprocessedModelImplToJson(
//         _$UnprocessedModelImpl instance) =>
//     <String, dynamic>{
//       'message': instance.message,
//       'errors': instance.errors,
//     };

// _$ErrorsImpl _$$ErrorsImplFromJson(Map<String, dynamic> json) => _$ErrorsImpl(
//       name:
//           (json['name'] as List<dynamic>?)?.map((e) => e as String).toList() ??
//               const [],
//       email:
//           (json['email'] as List<dynamic>?)?.map((e) => e as String).toList() ??
//               const [],
//       password: (json['password'] as List<dynamic>?)
//               ?.map((e) => e as String)
//               .toList() ??
//           const [],
//       phone:
//           (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList() ??
//               const [],
//     );

// Map<String, dynamic> _$$ErrorsImplToJson(_$ErrorsImpl instance) =>
//     <String, dynamic>{
//       'name': instance.name,
//       'email': instance.email,
//       'password': instance.password,
//       'phone': instance.phone,
//     };
