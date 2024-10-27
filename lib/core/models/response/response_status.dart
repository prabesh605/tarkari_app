// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_status.freezed.dart';

@freezed
class ResponseStatus<T> with _$ResponseStatus<T> {
  const factory ResponseStatus.initial() = ResponseStatusInitial;
  const factory ResponseStatus.progress() = ResponseStatusProgress;
  const factory ResponseStatus.error(Object error) = ResponseStatusError;
  const factory ResponseStatus.success({T? data}) = ResponseStatusSuccess;
}
