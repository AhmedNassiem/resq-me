part of 'pharmacy_cubit.dart';

@immutable
sealed class PharmacyState {}

final class PharmacyInitial extends PharmacyState {}
final class PharmacySuccess extends PharmacyState {
  final List<PharmacyModel> pharmacyModel;

  PharmacySuccess(this.pharmacyModel);
}
final class PharmacyStateFiltered extends PharmacyState {
  final List<PharmacyModel> filteredPharmacyModel;

  PharmacyStateFiltered(this.filteredPharmacyModel);
}
final class PharmacyFailure extends PharmacyState {}
