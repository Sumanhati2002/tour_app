class VisitorInfoModel {
  final String address;
  final String openingHours;
  final String entryFee;
  final String contactInfo;

  VisitorInfoModel({
    required this.address,
    required this.openingHours,
    required this.entryFee,
    required this.contactInfo,
  });

  factory VisitorInfoModel.fromJson(Map<String, dynamic> json) {
    return VisitorInfoModel(
      address: json['address'] ?? 'Not Available',
      openingHours: json['opening_hours'] ?? 'Not Available',
      entryFee: json['entry_fee'] ?? 'Free',
      contactInfo: json['contact_information'] ?? 'Not Available',
    );
  }
}
