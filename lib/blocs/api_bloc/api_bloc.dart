import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voltro_dxb/models/cases_model.dart';
import 'package:voltro_dxb/resources/repository.dart';

part 'api_event.dart';

part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  @override
  ApiState get initialState => ApiInitial();

  @override
  Stream<ApiState> mapEventToState(
    ApiEvent event,
  ) async* {
    try {
      if (event is FetchData) {
        yield LoadingState();
        Repository repository = Repository();
        List<CasesModel> casesOfAllCountries = await repository.fetchData();
        if (casesOfAllCountries.length == 0) {
          yield NoDataFoundState();
        } else {
          yield DataFetchedState(casesOfAllCountries: casesOfAllCountries);
        }
      }
    } catch (e) {
      yield FailureState(error: e.toString());
    }
  }
}
