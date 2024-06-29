import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:resq_me/Services/HospitalService.dart';

import '../Models/Hospital_Model.dart';

part 'hospital_state.dart';

class HospitalStateCubit extends Cubit<HospitalState> {
  List<HospitalModel> _allHospitals = [];

  HospitalStateCubit() : super(HospitalStateInitial());

  getHospitals() async {
    try {
      List<HospitalModel> hospitalModel =
          await HospitalServices().getHospitals();
      _allHospitals = hospitalModel;

      emit(HospitalStateSuccess(hospitalModel));
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['message'] ??
          'Oops, There was an error. Try later.';
      throw Exception(errorMessage);
    } catch (e) {
      emit(HospitalStateFailure());
    }
  }

  searchHospitals(String query) {
    if (query.isEmpty) {
      emit(HospitalStateSuccess(_allHospitals));
    } else {
      List<HospitalModel> filteredHospitals = _allHospitals.where((hospital) {
        return hospital.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(HospitalStateFiltered(filteredHospitals));
    }
  }
}
