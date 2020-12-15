part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}

class LoadingState extends ApiState {}

class NoDataFoundState extends ApiState {}

class FailureState extends ApiState {
  final String error;

  FailureState({this.error});
}

class DataFetchedState extends ApiState {
  final List<CasesModel> casesOfAllCountries;

  DataFetchedState({this.casesOfAllCountries});
}
