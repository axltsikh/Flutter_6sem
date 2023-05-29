import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labnine/generator.dart';

import 'Model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<FetchDataEvent>(_onFetchDataEvent);
  }

  void _onFetchDataEvent(
      FetchDataEvent event,
      Emitter<HomeState> emitter,
      ) async{
    emitter(const HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    List<Model> _dummyFoods = generatorModel.getModels();
    emitter(HomeSuccessFetchDataState(foods: _dummyFoods));
  }
}