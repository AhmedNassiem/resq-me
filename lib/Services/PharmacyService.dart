import 'package:dio/dio.dart';
import 'package:resq_me/constants.dart';

import '../Models/Pharmacy_Model.dart';

class PharmacyServices {
  final Dio dio = Dio();

  Future<List<PharmacyModel>> getPharmacies() async {
    try {
      Response response = await dio.get(kPharmaciesApiKey);
      List<dynamic> jsonData = response.data;
      List<PharmacyModel> PharmacyList = [];

      for (var Pharmacy in jsonData) {
        PharmacyModel pharmacyModel = PharmacyModel.fromJson(Pharmacy);
        PharmacyList.add(pharmacyModel);
      }
      print(PharmacyList);
      return PharmacyList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
