import '../../feature_state/model/location_model.dart';

class StateModel {
  final int id;
  final String stateName;
  final String? imageUrl;
  final String? stateDescription;
  final List<StateLocation> locations;

  StateModel({
    required this.id,
    required this.stateName,
    this.imageUrl,
    this.stateDescription,
    required this.locations,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id']??0,
      stateName: (json['statename'] ?? '').toString().trim(),
      imageUrl: (json['url'] ?? '').toString(),
      stateDescription: (json['statedescription'] ?? '').toString(),
      locations: (json['state_locations'] as List<dynamic>)
          .map((e) => StateLocation.fromJson(e))
          .toList(),
    );
  }
}
