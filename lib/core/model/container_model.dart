import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon_app/core/model/recyclable_model.dart';

class RecycleContainer {
  String? name;
  LatLng? location; //TODO: Convert this data type to GeoPoint
  List<Recyclable>? recyclables;

  RecycleContainer({this.name, this.location, this.recyclables});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'recyclables': recyclables,
    };
  }

  factory RecycleContainer.fromMap(Map<String, dynamic> map) {
    return RecycleContainer(
      name: map['name'],
      location: map['location'],
      recyclables: map['recyclables'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecycleContainer.fromJson(String source) =>
      RecycleContainer.fromMap(json.decode(source));
}