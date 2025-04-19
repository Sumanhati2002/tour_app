import 'package:hive/hive.dart';

import '../../feature_statelocation_details/model/visitorInfo_model.dart';
part 'location_model.g.dart';

@HiveType(typeId: 1)
class StateLocation extends HiveObject{

  @HiveField(0)
  final String? locationname;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final List<VisitorInformation> visitorInformation;

  StateLocation({
    required this.locationname,
    required this.description,
    required this.image,
    required this.visitorInformation,
  });

  factory StateLocation.fromJson(Map<String, dynamic> json) {
    final descriptionList = json['description'] as List<dynamic>? ?? [];

    final descriptionText = descriptionList
        .map((item) => item['children'] as List<dynamic>? ?? [])
        .expand((children) => children)
        .map((child) => child['text'])
        .whereType<String>()
        .join(' ');
    return StateLocation(
      locationname: (json['locationname'] ?? '').toString(),
      description: descriptionText,
      image: (json['image'] ?? '').toString(),
      visitorInformation: (json['Visitor_Information'] as List<dynamic>)
          .map((e) => VisitorInformation.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'locationname': locationname,
      'url': image,
      'description': description,
      'Visitor_Information': visitorInformation.map((e) => e.toJson()).toList(),
    };
  }
}