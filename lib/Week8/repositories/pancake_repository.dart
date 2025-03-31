import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/pancake.dart';

abstract class PancakeRepository {
  Future<Pancake> addPancake({required String color, required double price});
  Future<List<Pancake>> getPancakes();
  Future<void> updatePancake(String id, String color, double price);
  Future<void> deletePancake(String id);
}

class FirebasePancakeRepository extends PancakeRepository {
  static const String baseUrl = 'https://g2-first-project-default-rtdb.asia-southeast1.firebasedatabase.app';
  static const String pancakesCollection = "pancakes";
  static const String allPancakesUrl = '$baseUrl/$pancakesCollection.json';

  @override
  Future<Pancake> addPancake({required String color, required double price}) async {
    Uri uri = Uri.parse(allPancakesUrl);
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'color': color, 'price': price}),
    );
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to add pancake');
    }
    final newId = json.decode(response.body)['name'];
    return Pancake(id: newId, color: color, price: price);
  }

  @override
  Future<List<Pancake>> getPancakes() async {
    Uri uri = Uri.parse(allPancakesUrl);
    final response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load');
    }
    final data = json.decode(response.body) as Map<String, dynamic>?;
    if (data == null) return [];
    return data.entries.map((entry) => PancakeDto.fromJson(entry.key, entry.value)).toList();
  }

  @override
  Future<void> updatePancake(String id, String color, double price) async {
    Uri uri = Uri.parse('$baseUrl/$pancakesCollection/$id.json');
    final response = await http.patch(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'color': color, 'price': price}),
    );
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to update pancake');
    }
  }

  @override
  Future<void> deletePancake(String id) async {
    Uri uri = Uri.parse('$baseUrl/$pancakesCollection/$id.json');
    final response = await http.delete(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to delete pancake');
    }
  }
}