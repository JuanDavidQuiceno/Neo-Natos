part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class ChangeMedicineEvent extends HomeEvent {
  final MedicineModel model;

  const ChangeMedicineEvent(this.model);
}

class CalculateEvent extends HomeEvent {
  final double peso;
  const CalculateEvent(this.peso);
}

class CleanEvnet extends HomeEvent {}
