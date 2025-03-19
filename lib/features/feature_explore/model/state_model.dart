class StateModel {
  final String stateName;
  final String? imageUrl;
  final List<Map<String, dynamic>> locations; 

  StateModel({
    required this.stateName,
    this.imageUrl,
    required this.locations,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      stateName: json['statename'] ?? '',
      imageUrl: json['url'],
      locations: (json['state_locations'] as List?)
          ?.map((loc) => loc as Map<String, dynamic>)
          .toList() ??
          [],
    );
  }
}
