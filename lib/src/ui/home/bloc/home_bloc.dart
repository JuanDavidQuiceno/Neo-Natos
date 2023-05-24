// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/medicine_model.dart';

part 'home_event.dart';
part 'home_state.dart';

enum Medicine { Ampicilina, SurfactantePulmonar }

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MedicineModel selectMedicine = MedicineModel.fromJson({});
  List<MedicineModel> medicina = ListMedicineModel.fromJson({
    'data': [
      {
        'type': Medicine.Ampicilina,
        'description': 'Ampicilina',
      },
      {
        'type': Medicine.SurfactantePulmonar,
        'description': 'Surfactante pulmonar'
      }
    ]
  }).data;

  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) => emit(HomeInitialState()));
    on<ChangeMedicineEvent>(_changeMedicineState);
    on<CalculateEvent>(_calculeState);
    on<CleanEvnet>(_cleanState);
  }

  FutureOr<void> _changeMedicineState(
      ChangeMedicineEvent event, Emitter<HomeState> emit) {
    emit(HomeInitialState());

    selectMedicine = event.model;
    emit(ChangeMedicineState());
  }

  FutureOr<void> _calculeState(CalculateEvent event, Emitter<HomeState> emit) {
    emit(HomeInitialState());
    print(event.peso);
    if (selectMedicine.type == Medicine.Ampicilina) {
      double result = (event.peso * 25 * 5) / 500;
      emit(CalculateState(
        'La dosis de ${selectMedicine.description} es: *${result.toStringAsFixed(2)}* *ml*',
      ));
    } else if (selectMedicine.type == Medicine.SurfactantePulmonar) {
      double result = (event.peso * 200) / 25;
      final String resultString = result.toStringAsFixed(2);
      if (resultString.endsWith('00')) {
        emit(CalculateState(
            'La dosis de ${selectMedicine.description} es: *${result.toStringAsFixed(0)}ml*'));
      } else {
        emit(CalculateState(
            'La dosis de ${selectMedicine.description} es: *${result.toStringAsFixed(2)}ml*'));
      }
    } else {
      emit(HomeErrorState());
    }
  }

  _cleanState(CleanEvnet event, Emitter<HomeState> emit) {}
}
