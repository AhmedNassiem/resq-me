part of 'hospital_cubit.dart';

@immutable
sealed class HospitalState {}

final class HospitalStateInitial extends HospitalState {}
final class HospitalStateSuccess extends HospitalState {
  final List<HospitalModel> hospitalModel;

  HospitalStateSuccess(this.hospitalModel);
}
final class HospitalStateFiltered extends HospitalState {
  final List<HospitalModel> filteredHospitalModel;

  HospitalStateFiltered(this.filteredHospitalModel);
}
final class HospitalStateFailure extends HospitalState {}
