class VendorModel {

  final int id;
  final String businessName;
  final String category;

  VendorModel({
    required this.id,
    required this.businessName,
    required this.category,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {

    return VendorModel(
      id: json['id'],
      businessName: json['businessName'],
      category: json['category'],
    );

  }

}