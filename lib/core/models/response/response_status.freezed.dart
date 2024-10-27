// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResponseStatus<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() progress,
    required TResult Function(Object error) error,
    required TResult Function(T? data) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? progress,
    TResult? Function(Object error)? error,
    TResult? Function(T? data)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? progress,
    TResult Function(Object error)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStatusInitial<T> value) initial,
    required TResult Function(ResponseStatusProgress<T> value) progress,
    required TResult Function(ResponseStatusError<T> value) error,
    required TResult Function(ResponseStatusSuccess<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStatusInitial<T> value)? initial,
    TResult? Function(ResponseStatusProgress<T> value)? progress,
    TResult? Function(ResponseStatusError<T> value)? error,
    TResult? Function(ResponseStatusSuccess<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStatusInitial<T> value)? initial,
    TResult Function(ResponseStatusProgress<T> value)? progress,
    TResult Function(ResponseStatusError<T> value)? error,
    TResult Function(ResponseStatusSuccess<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseStatusCopyWith<T, $Res> {
  factory $ResponseStatusCopyWith(
          ResponseStatus<T> value, $Res Function(ResponseStatus<T>) then) =
      _$ResponseStatusCopyWithImpl<T, $Res, ResponseStatus<T>>;
}

/// @nodoc
class _$ResponseStatusCopyWithImpl<T, $Res, $Val extends ResponseStatus<T>>
    implements $ResponseStatusCopyWith<T, $Res> {
  _$ResponseStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResponseStatusInitialImplCopyWith<T, $Res> {
  factory _$$ResponseStatusInitialImplCopyWith(
          _$ResponseStatusInitialImpl<T> value,
          $Res Function(_$ResponseStatusInitialImpl<T>) then) =
      __$$ResponseStatusInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResponseStatusInitialImplCopyWithImpl<T, $Res>
    extends _$ResponseStatusCopyWithImpl<T, $Res,
        _$ResponseStatusInitialImpl<T>>
    implements _$$ResponseStatusInitialImplCopyWith<T, $Res> {
  __$$ResponseStatusInitialImplCopyWithImpl(
      _$ResponseStatusInitialImpl<T> _value,
      $Res Function(_$ResponseStatusInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResponseStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResponseStatusInitialImpl<T> implements ResponseStatusInitial<T> {
  const _$ResponseStatusInitialImpl();

  @override
  String toString() {
    return 'ResponseStatus<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseStatusInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() progress,
    required TResult Function(Object error) error,
    required TResult Function(T? data) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? progress,
    TResult? Function(Object error)? error,
    TResult? Function(T? data)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? progress,
    TResult Function(Object error)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStatusInitial<T> value) initial,
    required TResult Function(ResponseStatusProgress<T> value) progress,
    required TResult Function(ResponseStatusError<T> value) error,
    required TResult Function(ResponseStatusSuccess<T> value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStatusInitial<T> value)? initial,
    TResult? Function(ResponseStatusProgress<T> value)? progress,
    TResult? Function(ResponseStatusError<T> value)? error,
    TResult? Function(ResponseStatusSuccess<T> value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStatusInitial<T> value)? initial,
    TResult Function(ResponseStatusProgress<T> value)? progress,
    TResult Function(ResponseStatusError<T> value)? error,
    TResult Function(ResponseStatusSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ResponseStatusInitial<T> implements ResponseStatus<T> {
  const factory ResponseStatusInitial() = _$ResponseStatusInitialImpl<T>;
}

/// @nodoc
abstract class _$$ResponseStatusProgressImplCopyWith<T, $Res> {
  factory _$$ResponseStatusProgressImplCopyWith(
          _$ResponseStatusProgressImpl<T> value,
          $Res Function(_$ResponseStatusProgressImpl<T>) then) =
      __$$ResponseStatusProgressImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResponseStatusProgressImplCopyWithImpl<T, $Res>
    extends _$ResponseStatusCopyWithImpl<T, $Res,
        _$ResponseStatusProgressImpl<T>>
    implements _$$ResponseStatusProgressImplCopyWith<T, $Res> {
  __$$ResponseStatusProgressImplCopyWithImpl(
      _$ResponseStatusProgressImpl<T> _value,
      $Res Function(_$ResponseStatusProgressImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResponseStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResponseStatusProgressImpl<T> implements ResponseStatusProgress<T> {
  const _$ResponseStatusProgressImpl();

  @override
  String toString() {
    return 'ResponseStatus<$T>.progress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseStatusProgressImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() progress,
    required TResult Function(Object error) error,
    required TResult Function(T? data) success,
  }) {
    return progress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? progress,
    TResult? Function(Object error)? error,
    TResult? Function(T? data)? success,
  }) {
    return progress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? progress,
    TResult Function(Object error)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStatusInitial<T> value) initial,
    required TResult Function(ResponseStatusProgress<T> value) progress,
    required TResult Function(ResponseStatusError<T> value) error,
    required TResult Function(ResponseStatusSuccess<T> value) success,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStatusInitial<T> value)? initial,
    TResult? Function(ResponseStatusProgress<T> value)? progress,
    TResult? Function(ResponseStatusError<T> value)? error,
    TResult? Function(ResponseStatusSuccess<T> value)? success,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStatusInitial<T> value)? initial,
    TResult Function(ResponseStatusProgress<T> value)? progress,
    TResult Function(ResponseStatusError<T> value)? error,
    TResult Function(ResponseStatusSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class ResponseStatusProgress<T> implements ResponseStatus<T> {
  const factory ResponseStatusProgress() = _$ResponseStatusProgressImpl<T>;
}

/// @nodoc
abstract class _$$ResponseStatusErrorImplCopyWith<T, $Res> {
  factory _$$ResponseStatusErrorImplCopyWith(_$ResponseStatusErrorImpl<T> value,
          $Res Function(_$ResponseStatusErrorImpl<T>) then) =
      __$$ResponseStatusErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$ResponseStatusErrorImplCopyWithImpl<T, $Res>
    extends _$ResponseStatusCopyWithImpl<T, $Res, _$ResponseStatusErrorImpl<T>>
    implements _$$ResponseStatusErrorImplCopyWith<T, $Res> {
  __$$ResponseStatusErrorImplCopyWithImpl(_$ResponseStatusErrorImpl<T> _value,
      $Res Function(_$ResponseStatusErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResponseStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ResponseStatusErrorImpl<T>(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ResponseStatusErrorImpl<T> implements ResponseStatusError<T> {
  const _$ResponseStatusErrorImpl(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'ResponseStatus<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseStatusErrorImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of ResponseStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseStatusErrorImplCopyWith<T, _$ResponseStatusErrorImpl<T>>
      get copyWith => __$$ResponseStatusErrorImplCopyWithImpl<T,
          _$ResponseStatusErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() progress,
    required TResult Function(Object error) error,
    required TResult Function(T? data) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? progress,
    TResult? Function(Object error)? error,
    TResult? Function(T? data)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? progress,
    TResult Function(Object error)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStatusInitial<T> value) initial,
    required TResult Function(ResponseStatusProgress<T> value) progress,
    required TResult Function(ResponseStatusError<T> value) error,
    required TResult Function(ResponseStatusSuccess<T> value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStatusInitial<T> value)? initial,
    TResult? Function(ResponseStatusProgress<T> value)? progress,
    TResult? Function(ResponseStatusError<T> value)? error,
    TResult? Function(ResponseStatusSuccess<T> value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStatusInitial<T> value)? initial,
    TResult Function(ResponseStatusProgress<T> value)? progress,
    TResult Function(ResponseStatusError<T> value)? error,
    TResult Function(ResponseStatusSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResponseStatusError<T> implements ResponseStatus<T> {
  const factory ResponseStatusError(final Object error) =
      _$ResponseStatusErrorImpl<T>;

  Object get error;

  /// Create a copy of ResponseStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseStatusErrorImplCopyWith<T, _$ResponseStatusErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResponseStatusSuccessImplCopyWith<T, $Res> {
  factory _$$ResponseStatusSuccessImplCopyWith(
          _$ResponseStatusSuccessImpl<T> value,
          $Res Function(_$ResponseStatusSuccessImpl<T>) then) =
      __$$ResponseStatusSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$ResponseStatusSuccessImplCopyWithImpl<T, $Res>
    extends _$ResponseStatusCopyWithImpl<T, $Res,
        _$ResponseStatusSuccessImpl<T>>
    implements _$$ResponseStatusSuccessImplCopyWith<T, $Res> {
  __$$ResponseStatusSuccessImplCopyWithImpl(
      _$ResponseStatusSuccessImpl<T> _value,
      $Res Function(_$ResponseStatusSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResponseStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResponseStatusSuccessImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$ResponseStatusSuccessImpl<T> implements ResponseStatusSuccess<T> {
  const _$ResponseStatusSuccessImpl({this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'ResponseStatus<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseStatusSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ResponseStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseStatusSuccessImplCopyWith<T, _$ResponseStatusSuccessImpl<T>>
      get copyWith => __$$ResponseStatusSuccessImplCopyWithImpl<T,
          _$ResponseStatusSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() progress,
    required TResult Function(Object error) error,
    required TResult Function(T? data) success,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? progress,
    TResult? Function(Object error)? error,
    TResult? Function(T? data)? success,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? progress,
    TResult Function(Object error)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStatusInitial<T> value) initial,
    required TResult Function(ResponseStatusProgress<T> value) progress,
    required TResult Function(ResponseStatusError<T> value) error,
    required TResult Function(ResponseStatusSuccess<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStatusInitial<T> value)? initial,
    TResult? Function(ResponseStatusProgress<T> value)? progress,
    TResult? Function(ResponseStatusError<T> value)? error,
    TResult? Function(ResponseStatusSuccess<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStatusInitial<T> value)? initial,
    TResult Function(ResponseStatusProgress<T> value)? progress,
    TResult Function(ResponseStatusError<T> value)? error,
    TResult Function(ResponseStatusSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ResponseStatusSuccess<T> implements ResponseStatus<T> {
  const factory ResponseStatusSuccess({final T? data}) =
      _$ResponseStatusSuccessImpl<T>;

  T? get data;

  /// Create a copy of ResponseStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseStatusSuccessImplCopyWith<T, _$ResponseStatusSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
