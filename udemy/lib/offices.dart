import 'dart:convert' as convert;
import 'package:json_annotation/json_annotation.dart';

import 'package:http/http.dart' as http;

part 'offices.g.dart';

@JsonSerializable()
class OfficesList {
  List<Office> offices;
  OfficesList({this.offices = const []});

  factory OfficesList.fromJson(Map<String, dynamic> json) => _$OfficesListFromJson(json);

  Map<String, dynamic> toJson() =>_$OfficesListToJson(this);
}

@JsonSerializable()
class Office {
  @JsonKey()
  final String name;
  final String address;
  final String image;
  Office({this.name = '', this.address = '', this.image = ''});

  factory Office.fromJson(Map<String, dynamic>json) => _$OfficeFromJson(json);

  Map<String, dynamic> toJson() =>_$OfficeToJson(this);
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