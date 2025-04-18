class VisitorInformation{
  final String? address;
  final String? openingHours;
  final String? entryFee;
  final String? contactInformation;

  VisitorInformation({
    required this.address,
    required this.openingHours,
    required this.entryFee,
    required this.contactInformation,
  });
  factory VisitorInformation.fromJson(Map<String, dynamic> json) {
    return VisitorInformation(
      address: (json['address'] ?? '').toString(),
      openingHours: (json['opening_hours'] ?? '').toString(),
      entryFee: (json['entry_fee'] ?? '').toString(),
      contactInformation: (json['contact_information'] ?? '').toString(),
    );
  }
  factory VisitorInformation.empty() {
    return VisitorInformation(
      address: '',
      openingHours: '',
      entryFee: '',
      contactInformation: '',
    );
  }
}