import 'dart:convert' as convert;

import 'package:http/http.dart' as http;


class OfficesList {
  List<Office> offices;
  OfficesList({this.offices = const []});

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    var officesJson = json['offices'] as List;
    List<Office> officesList = officesJson.map((office) => Office.fromJson(office)).toList();

    return OfficesList(
    offices: officesList
    );
  }
}

class Office {
  final String name;
  final String address;
  final String image;
  Office({this.name = '', this.address = '', this.image = ''});

  factory Office.fromJson(Map<String, dynamic>json){
    return Office(
      name: json['name'] as String,
      address: json['address'] as String,
      image: json['image'] as String,
    );
  }
}

Future<OfficesList>getOfficeList() async {
  var url = Uri.parse('https://about.google/static/data/locations.json');
  var res = await http.get(url);

  // .then((res) => {
  if (res.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(res.body) as Map<String, dynamic>;
   return OfficesList.fromJson(jsonResponse);
  } else {
    throw Exception('Error ${res.reasonPhrase}');
  }
  // }).catchError((err){
  // debugPrint(err.toString());
  // })
}