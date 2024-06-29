import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../Models/Pharmacy_Model.dart';
import '../Services/PharmacyService.dart';
part 'pharmacy_state.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  List<PharmacyModel> _allPharmacy = [];
  PharmacyCubit() : super(PharmacyInitial());

  getPharmacies() async {
    try {
      List<PharmacyModel> pharmacyModel =
          await PharmacyServices().getPharmacies();
      _allPharmacy = pharmacyModel;
      emit(PharmacySuccess(pharmacyModel));
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['message'] ??
          'Oops,There was an error,Try later';
      throw Exception(errorMessage);
    } catch (e) {
      emit(PharmacyFailure());
    }
  }

  void searchPharmacy(String query) {
    if (query.isEmpty) {
      emit(PharmacySuccess(_allPharmacy));
    } else {
      List<PharmacyModel> filteredPharmacies = _allPharmacy.where((pharmacy) {
        return pharmacy.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(PharmacyStateFiltered(filteredPharmacies));
    }
  }
}
