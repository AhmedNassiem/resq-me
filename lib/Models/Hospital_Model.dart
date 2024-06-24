class HospitalModel{
  final String name;
  final String government;
  final String city;
  final String kindName;


  factory HospitalModel.fromJson(json)
  {
    return HospitalModel(name: json['name'], government: json['government'],
        city: json['city'],kindName: json['kindName']);
  }

  HospitalModel({required this.name, required this.government, required this.city, required this.kindName});
}