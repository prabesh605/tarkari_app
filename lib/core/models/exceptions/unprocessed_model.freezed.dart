// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'unprocessed_model.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

// UnprocessedModel _$UnprocessedModelFromJson(Map<String, dynamic> json) {
//   return _UnprocessedModel.fromJson(json);
// }

// /// @nodoc
// mixin _$UnprocessedModel {
//   String? get message => throw _privateConstructorUsedError;
//   Errors? get errors => throw _privateConstructorUsedError;

//   /// Serializes this UnprocessedModel to a JSON map.
//   Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

//   /// Create a copy of UnprocessedModel
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   $UnprocessedModelCopyWith<UnprocessedModel> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $UnprocessedModelCopyWith<$Res> {
//   factory $UnprocessedModelCopyWith(
//           UnprocessedModel value, $Res Function(UnprocessedModel) then) =
//       _$UnprocessedModelCopyWithImpl<$Res, UnprocessedModel>;
//   @useResult
//   $Res call({String? message, Errors? errors});

//   $ErrorsCopyWith<$Res>? get errors;
// }

// /// @nodoc
// class _$UnprocessedModelCopyWithImpl<$Res, $Val extends UnprocessedModel>
//     implements $UnprocessedModelCopyWith<$Res> {
//   _$UnprocessedModelCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   /// Create a copy of UnprocessedModel
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? message = freezed,
//     Object? errors = freezed,
//   }) {
//     return _then(_value.copyWith(
//       message: freezed == message
//           ? _value.message
//           : message // ignore: cast_nullable_to_non_nullable
//               as String?,
//       errors: freezed == errors
//           ? _value.errors
//           : errors // ignore: cast_nullable_to_non_nullable
//               as Errors?,
//     ) as $Val);
//   }

//   /// Create a copy of UnprocessedModel
//   /// with the given fields replaced by the non-null parameter values.
//   @override
//   @pragma('vm:prefer-inline')
//   $ErrorsCopyWith<$Res>? get errors {
//     if (_value.errors == null) {
//       return null;
//     }

//     return $ErrorsCopyWith<$Res>(_value.errors!, (value) {
//       return _then(_value.copyWith(errors: value) as $Val);
//     });
//   }
// }

// /// @nodoc
// abstract class _$$UnprocessedModelImplCopyWith<$Res>
//     implements $UnprocessedModelCopyWith<$Res> {
//   factory _$$UnprocessedModelImplCopyWith(_$UnprocessedModelImpl value,
//           $Res Function(_$UnprocessedModelImpl) then) =
//       __$$UnprocessedModelImplCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call({String? message, Errors? errors});

//   @override
//   $ErrorsCopyWith<$Res>? get errors;
// }

// /// @nodoc
// class __$$UnprocessedModelImplCopyWithImpl<$Res>
//     extends _$UnprocessedModelCopyWithImpl<$Res, _$UnprocessedModelImpl>
//     implements _$$UnprocessedModelImplCopyWith<$Res> {
//   __$$UnprocessedModelImplCopyWithImpl(_$UnprocessedModelImpl _value,
//       $Res Function(_$UnprocessedModelImpl) _then)
//       : super(_value, _then);

//   /// Create a copy of UnprocessedModel
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? message = freezed,
//     Object? errors = freezed,
//   }) {
//     return _then(_$UnprocessedModelImpl(
//       message: freezed == message
//           ? _value.message
//           : message // ignore: cast_nullable_to_non_nullable
//               as String?,
//       errors: freezed == errors
//           ? _value.errors
//           : errors // ignore: cast_nullable_to_non_nullable
//               as Errors?,
//     ));
//   }
// }

// /// @nodoc
// @JsonSerializable()
// class _$UnprocessedModelImpl implements _UnprocessedModel {
//   const _$UnprocessedModelImpl({this.message = '', this.errors});

//   factory _$UnprocessedModelImpl.fromJson(Map<String, dynamic> json) =>
//       _$$UnprocessedModelImplFromJson(json);

//   @override
//   @JsonKey()
//   final String? message;
//   @override
//   final Errors? errors;

//   @override
//   String toString() {
//     return 'UnprocessedModel(message: $message, errors: $errors)';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$UnprocessedModelImpl &&
//             (identical(other.message, message) || other.message == message) &&
//             (identical(other.errors, errors) || other.errors == errors));
//   }

//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   int get hashCode => Object.hash(runtimeType, message, errors);

//   /// Create a copy of UnprocessedModel
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$UnprocessedModelImplCopyWith<_$UnprocessedModelImpl> get copyWith =>
//       __$$UnprocessedModelImplCopyWithImpl<_$UnprocessedModelImpl>(
//           this, _$identity);

//   @override
//   Map<String, dynamic> toJson() {
//     return _$$UnprocessedModelImplToJson(
//       this,
//     );
//   }
// }

// abstract class _UnprocessedModel implements UnprocessedModel {
//   const factory _UnprocessedModel(
//       {final String? message, final Errors? errors}) = _$UnprocessedModelImpl;

//   factory _UnprocessedModel.fromJson(Map<String, dynamic> json) =
//       _$UnprocessedModelImpl.fromJson;

//   @override
//   String? get message;
//   @override
//   Errors? get errors;

//   /// Create a copy of UnprocessedModel
//   /// with the given fields replaced by the non-null parameter values.
//   @override
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   _$$UnprocessedModelImplCopyWith<_$UnprocessedModelImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// Errors _$ErrorsFromJson(Map<String, dynamic> json) {
//   return _Errors.fromJson(json);
// }

// /// @nodoc
// mixin _$Errors {
//   List<String>? get name => throw _privateConstructorUsedError;
//   List<String>? get email => throw _privateConstructorUsedError;
//   List<String>? get password => throw _privateConstructorUsedError;
//   List<String>? get phone => throw _privateConstructorUsedError;

//   /// Serializes this Errors to a JSON map.
//   Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

//   /// Create a copy of Errors
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   $ErrorsCopyWith<Errors> get copyWith => throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $ErrorsCopyWith<$Res> {
//   factory $ErrorsCopyWith(Errors value, $Res Function(Errors) then) =
//       _$ErrorsCopyWithImpl<$Res, Errors>;
//   @useResult
//   $Res call(
//       {List<String>? name,
//       List<String>? email,
//       List<String>? password,
//       List<String>? phone});
// }

// /// @nodoc
// class _$ErrorsCopyWithImpl<$Res, $Val extends Errors>
//     implements $ErrorsCopyWith<$Res> {
//   _$ErrorsCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   /// Create a copy of Errors
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? name = freezed,
//     Object? email = freezed,
//     Object? password = freezed,
//     Object? phone = freezed,
//   }) {
//     return _then(_value.copyWith(
//       name: freezed == name
//           ? _value.name
//           : name // ignore: cast_nullable_to_non_nullable
//               as List<String>?,
//       email: freezed == email
//           ? _value.email
//           : email // ignore: cast_nullable_to_non_nullable
//               as List<String>?,
//       password: freezed == password
//           ? _value.password
//           : password // ignore: cast_nullable_to_non_nullable
//               as List<String>?,
//       phone: freezed == phone
//           ? _value.phone
//           : phone // ignore: cast_nullable_to_non_nullable
//               as List<String>?,
//     ) as $Val);
//   }
// }

// /// @nodoc
// abstract class _$$ErrorsImplCopyWith<$Res> implements $ErrorsCopyWith<$Res> {
//   factory _$$ErrorsImplCopyWith(
//           _$ErrorsImpl value, $Res Function(_$ErrorsImpl) then) =
//       __$$ErrorsImplCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call(
//       {List<String>? name,
//       List<String>? email,
//       List<String>? password,
//       List<String>? phone});
// }

// /// @nodoc
// class __$$ErrorsImplCopyWithImpl<$Res>
//     extends _$ErrorsCopyWithImpl<$Res, _$ErrorsImpl>
//     implements _$$ErrorsImplCopyWith<$Res> {
//   __$$ErrorsImplCopyWithImpl(
//       _$ErrorsImpl _value, $Res Function(_$ErrorsImpl) _then)
//       : super(_value, _then);

//   /// Create a copy of Errors
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? name = freezed,
//     Object? email = freezed,
//     Object? password = freezed,
//     Object? phone = freezed,
//   }) {
//     return _then(_$ErrorsImpl(
//       name: freezed == name
//           ? _value._name
//           : name // ignore: cast_nullable_to_non_nullable
//               as List<String>?,
//       email: freezed == email
//           ? _value._email
//           : email // ignore: cast_nullable_to_non_nullable
//               as List<String>?,
//       password: freezed == password
//           ? _value._password
//           : password // ignore: cast_nullable_to_non_nullable
//               as List<String>?,
//       phone: freezed == phone
//           ? _value._phone
//           : phone // ignore: cast_nullable_to_non_nullable
//               as List<String>?,
//     ));
//   }
// }

// /// @nodoc
// @JsonSerializable()
// class _$ErrorsImpl implements _Errors {
//   const _$ErrorsImpl(
//       {final List<String>? name = const [],
//       final List<String>? email = const [],
//       final List<String>? password = const [],
//       final List<String>? phone = const []})
//       : _name = name,
//         _email = email,
//         _password = password,
//         _phone = phone;

//   factory _$ErrorsImpl.fromJson(Map<String, dynamic> json) =>
//       _$$ErrorsImplFromJson(json);

//   final List<String>? _name;
//   @override
//   @JsonKey()
//   List<String>? get name {
//     final value = _name;
//     if (value == null) return null;
//     if (_name is EqualUnmodifiableListView) return _name;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(value);
//   }

//   final List<String>? _email;
//   @override
//   @JsonKey()
//   List<String>? get email {
//     final value = _email;
//     if (value == null) return null;
//     if (_email is EqualUnmodifiableListView) return _email;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(value);
//   }

//   final List<String>? _password;
//   @override
//   @JsonKey()
//   List<String>? get password {
//     final value = _password;
//     if (value == null) return null;
//     if (_password is EqualUnmodifiableListView) return _password;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(value);
//   }

//   final List<String>? _phone;
//   @override
//   @JsonKey()
//   List<String>? get phone {
//     final value = _phone;
//     if (value == null) return null;
//     if (_phone is EqualUnmodifiableListView) return _phone;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(value);
//   }

//   @override
//   String toString() {
//     return 'Errors(name: $name, email: $email, password: $password, phone: $phone)';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$ErrorsImpl &&
//             const DeepCollectionEquality().equals(other._name, _name) &&
//             const DeepCollectionEquality().equals(other._email, _email) &&
//             const DeepCollectionEquality().equals(other._password, _password) &&
//             const DeepCollectionEquality().equals(other._phone, _phone));
//   }

//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   int get hashCode => Object.hash(
//       runtimeType,
//       const DeepCollectionEquality().hash(_name),
//       const DeepCollectionEquality().hash(_email),
//       const DeepCollectionEquality().hash(_password),
//       const DeepCollectionEquality().hash(_phone));

//   /// Create a copy of Errors
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$ErrorsImplCopyWith<_$ErrorsImpl> get copyWith =>
//       __$$ErrorsImplCopyWithImpl<_$ErrorsImpl>(this, _$identity);

//   @override
//   Map<String, dynamic> toJson() {
//     return _$$ErrorsImplToJson(
//       this,
//     );
//   }
// }

// abstract class _Errors implements Errors {
//   const factory _Errors(
//       {final List<String>? name,
//       final List<String>? email,
//       final List<String>? password,
//       final List<String>? phone}) = _$ErrorsImpl;

//   factory _Errors.fromJson(Map<String, dynamic> json) = _$ErrorsImpl.fromJson;

//   @override
//   List<String>? get name;
//   @override
//   List<String>? get email;
//   @override
//   List<String>? get password;
//   @override
//   List<String>? get phone;

//   /// Create a copy of Errors
//   /// with the given fields replaced by the non-null parameter values.
//   @override
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   _$$ErrorsImplCopyWith<_$ErrorsImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }
