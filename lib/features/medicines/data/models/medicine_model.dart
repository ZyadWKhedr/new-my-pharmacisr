import 'package:new_my_pharmacist/features/medicines/domain/entities/medicine.dart';

class MedicineModel {
  final String id;
  final String name;
  final String composition;
  final String uses;
  final String sideEffects;
  final String imageUrl;
  final String manufacturer;

  MedicineModel({
    required this.id,
    required this.name,
    required this.composition,
    required this.uses,
    required this.sideEffects,
    required this.imageUrl,
    required this.manufacturer,
  });

  /// Convert Entity to Model
  factory MedicineModel.fromEntity(Medicine entity) {
    return MedicineModel(
      id: entity.id,
      name: entity.name,
      composition: entity.composition,
      uses: entity.uses,
      sideEffects: entity.sideEffects,
      imageUrl: entity.imageUrl,
      manufacturer: entity.manufacturer,
    );
  }

  /// Convert Model to Entity
  Medicine toEntity() {
    return Medicine(
      id: id, 
      name: name,
      composition: composition,
      uses: uses,
      sideEffects: sideEffects,
      imageUrl: imageUrl,
      manufacturer: manufacturer,
    );
  }

  /// For local DB (optional)
  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'] ?? '', // Added ID field here
      name: json['name'] ?? '',
      composition: json['composition'] ?? '',
      uses: json['uses'] ?? '',
      sideEffects: json['sideEffects'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Added ID field here
      'name': name,
      'composition': composition,
      'uses': uses,
      'sideEffects': sideEffects,
      'imageUrl': imageUrl,
      'manufacturer': manufacturer,
    };
  }
}
