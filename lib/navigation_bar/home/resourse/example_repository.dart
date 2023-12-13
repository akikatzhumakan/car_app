import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_8_9/rest_client/mobile_api_cars.dart';

import '../../../rest_client/mobile_api_dio.dart';
import '../bloc/list_bloc.dart';

class ListRepository {
  final _mobileClientCars = MobileClientCars(MobileApiDio().client);

  Future<void> getListData(
      FetchedListEvent event, Emitter<ListState> emit) async {
    emit(LoadingListState());
    try {
      final getListData = await _mobileClientCars.getListData();
      emit(LoadedListState(getListData));
    } catch (e) {
      emit(FailureProfileState(e.toString()));
    }
  }
}
