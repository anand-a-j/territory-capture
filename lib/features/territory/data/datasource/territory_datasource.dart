import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/errors/exeption.dart';
import '../models/territory_dto.dart';

class TerritoryRemoteDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveTerritory(TerritoryDTO dto) async {
    try {
      final docRef = firestore.collection('territories').doc(dto.id);

      await docRef.set(dto.toJson());
    } catch (e) {
      debugPrint("saveTerritory ERROR: $e");
      throw DatabaseException("Failed to save territory");
    }
  }

  Future<List<TerritoryDTO>> getUserTerritories(String userId) async {
    try {
      final snap = await firestore
          .collection('territories')
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .get();

      return snap.docs
          .map((doc) => TerritoryDTO.fromJson(doc.data()).copyWith(id: doc.id))
          .toList();
    } catch (e) {
      debugPrint("getUserTerritories ERROR: $e");
      throw DatabaseException("Failed to load territories");
    }
  }

  Future<void> deleteTerritory(String territoryId) async {
    try {
      await firestore.collection('territories').doc(territoryId).delete();
    } catch (e) {
      debugPrint("deleteTerritory ERROR: $e");
      throw DatabaseException("Failed to delete territory");
    }
  }
}
