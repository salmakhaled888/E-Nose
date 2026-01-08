part of 'result_cubit.dart';

@immutable
abstract class ResultState {}

class ResultInitial extends ResultState {}
class ResultLoading extends ResultState {}
class ResultFailing extends ResultState {}
class ResultSuccess extends ResultState {
  Result result;
  ResultSuccess({required this.result});
}