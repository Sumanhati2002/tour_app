import '../../feature_statelocation_details/model/visitorInfo_model.dart';

class StateLocation {
  final String? locationname;
  final String description;
  final String image;
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
        .join(' '); // optional: separate sentences with a space
    return StateLocation(
      locationname: (json['locationname']??'').toString(),
      description: descriptionText,
      image: (json['image']??'').toString(),
      visitorInformation: (json['Visitor_Information'] as List<dynamic>)
          .map((e) => VisitorInformation.fromJson(e))
          .toList(),
    );
  }
}