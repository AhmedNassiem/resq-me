class PharmacyModel{
  final String name;
  final String government;
  final String city;



  factory PharmacyModel.fromJson(json)
  {
    return PharmacyModel(name: json['name'], government: json['government'],
        city: json['city']);
  }

  PharmacyModel({required this.name, required this.government, required this.city});
}