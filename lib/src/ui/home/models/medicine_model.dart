// To parse this JSON data, do
//
//     final listMedicineModel = listMedicineModelFromJson(jsonString);

import 'dart:convert';

import 'package:neonatos/src/ui/home/bloc/home_bloc.dart';

ListMedicineModel listMedicineModelFromJson(String str) =>
    ListMedicineModel.fromJson(json.decode(str));

String listMedicineModelToJson(ListMedicineModel data) =>
    json.encode(data.toJson());

class ListMedicineModel {
  List<MedicineModel> data;

  ListMedicineModel({
    required this.data,
  });

  factory ListMedicineModel.fromJson(Map<String, dynamic> json) =>
      ListMedicineModel(
        data: List<MedicineModel>.from(
            json["data"].map((x) => MedicineModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MedicineModel {
  Medicine type;
  String description;

  MedicineModel({
    required this.type,
    required this.description,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
        type: json["type"] == null
            ? Medicine.Ampicilina
            : json['type'] as Medicine,
        description: json["description"] == null
            ? 'Sin descripcion'
            : json['description'].toString(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "description": description,
      };
}
