import 'package:hive/hive.dart';

import '../../feature_state/model/location_model.dart';
part 'state_model.g.dart';

@HiveType(typeId: 0)
class StateModel extends HiveObject{

  @HiveField(0)
  final String stateName;
  @HiveField(1)
  final String? imageUrl;
  @HiveField(2)
  final String? stateDescription;
  @HiveField(3)
  final List<StateLocation> locations;

  StateModel({
    required this.stateName,
    this.imageUrl,
    this.stateDescription,
    required this.locations,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      stateName: (json['statename'] ?? '').toString().trim(),
      imageUrl: (json['url'] ?? '').toString(),
      stateDescription: (json['statedescription'] ?? '').toString(),
      locations: (json['state_locations'] as List<dynamic>)
          .map((e) => StateLocation.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statename': stateName,
      'url': imageUrl,
      'statedescription': stateDescription,
      'state_locations': locations.map((e) => e.toJson()).toList(),
    };
  }
}
