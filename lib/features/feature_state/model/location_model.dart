

import '../../feature_statelocation_details/model/visitorInfo_model.dart';

class LocationModel {
  final String locationName;
  final String imageUrl;
  final String description;
  final VisitorInfoModel visitorInfo;

  LocationModel({
    required this.locationName,
    required this.imageUrl,
    required this.description,
    required this.visitorInfo,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      locationName: json['locationname'] ?? 'Unknown',
      imageUrl: json['image'] ?? '',
      description: json['description']?[0]['children']?[0]['text'] ?? '',
      visitorInfo: VisitorInfoModel.fromJson(json['Visitor_Information']?[0] ?? {}),
    );
  }
}
