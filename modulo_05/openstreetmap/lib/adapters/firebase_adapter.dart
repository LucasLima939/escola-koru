import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:openstreetmap/entities/location_entity.dart';
import 'package:openstreetmap/models/location_model.dart';

class FirebaseAdapter {
  final db = FirebaseFirestore.instance;

  Future<void> setLocation(LocationEntity location) async {
    await db.collection("locations").add(location.toJson()).catchError((e) {
      print(e);
    });
  }

  Future<LocationEntity?> getLocation() async {
    try {
      final documents = await db.collection('locations').get();
      var data = documents.docs.firstOrNull?.data();
      return data != null ? LocationModel.fromJson(data) : null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
