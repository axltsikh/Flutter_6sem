

import 'package:equatable/equatable.dart';

import 'Model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();

  @override
  List<Object?> get props => [];
}

class HomeSuccessFetchDataState extends HomeState {
  final List<Model> foods;
  const HomeSuccessFetchDataState({
    required this.foods,
  });

  @override
  List<Object?> get props => [];
}