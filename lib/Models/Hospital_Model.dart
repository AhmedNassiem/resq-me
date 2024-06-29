class HospitalModel {
  final String name;
  final String government;
  final String city;
  final String kindName;
  final double latitude;
  final double longitude;
  final String call;

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    List<String> locationSplit = json['location'].split(',');
    double latitude = double.parse(locationSplit[0]);
    double longitude = double.parse(locationSplit[1]);
    String numbers = json['phone'];
    String call = numbers.replaceAll(' ', '');

    return HospitalModel(
      name: json['name'],
      government: json['government'],
      city: json['city'],
      kindName: json['kindName'],
      latitude: latitude,
      longitude: longitude,
      call: call,
    );
  }

  HospitalModel(
      {required this.name,
      required this.government,
      required this.city,
      required this.kindName,
      required this.latitude,
      required this.longitude,
      required this.call});
}
