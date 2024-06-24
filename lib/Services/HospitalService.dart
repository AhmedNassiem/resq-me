

import 'package:dio/dio.dart';
import 'package:resq_me/constants.dart';

import '../Models/Hospital_Model.dart';


class HospitalServices{
  final Dio dio=Dio();

  Future<List<HospitalModel>>getHospitals () async{
    try {
      Response response=await dio.get(kHospitalsApiKey);
      List<dynamic> jsonData=response.data;
      List<HospitalModel> hospitalList=[];

      for(var hospital in jsonData){
        HospitalModel hospitalModel =HospitalModel.fromJson(hospital);
        hospitalList.add(hospitalModel);

      }

      return hospitalList;
    } catch (e) {
      print(e.toString());
      return [];
    }

  }

}