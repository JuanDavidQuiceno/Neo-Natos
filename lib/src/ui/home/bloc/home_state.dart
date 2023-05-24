part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeInitialState extends HomeState {}

class ChangeMedicineState extends HomeState {}

class CalculateState extends HomeState {
  final String result;
  const CalculateState(this.result);
}

class HomeErrorState extends HomeState {}
