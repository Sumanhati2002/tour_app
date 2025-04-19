import 'package:hive/hive.dart';
part 'visitorInfo_model.g.dart';

@HiveType(typeId: 2)
class VisitorInformation extends HiveObject{
  
  @HiveField(0)
  final String? address;
  @HiveField(1)
  final String? openingHours;
  @HiveField(2)
  final String? entryFee;
  @HiveField(3)
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

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'opening_hours': openingHours,
      'entry_fee': entryFee,
      'contact_information': contactInformation,
    };
  }
}