class PharmacyModel {
  final String name;
  final String government;
  final String city;
  final double latitude;
  final double longitude;
  final String call;

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    List<String> locationSplit = json['location'].split(',');
    double latitude = double.parse(locationSplit[0]);
    double longitude = double.parse(locationSplit[1]);
    String numbers = json['phone'] ?? '123';

    return PharmacyModel(
      name: json['name'],
      government: json['government'],
      city: json['city'],
      latitude: latitude,
      longitude: longitude,
      call: numbers,
    );
  }

  PharmacyModel({
    required this.name,
    required this.government,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.call,
  });
}
