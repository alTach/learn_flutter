import 'package:udemy/feature/domain/entities/person_entity.dart';

class LocationModal extends LocationEntity {
  factory LocationModal.fromJson(Map<String, dynamic> json) {
    return LocationModal(
        name: json['name'],
        url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
