import 'package:flutter/material.dart';

import '../models/pancake.dart';
import '../repositories/pancake_repository.dart';

class PancakeProvider extends ChangeNotifier {
  final PancakeRepository _repository;
  List<Pancake> _pancakes = [];

  PancakeProvider(this._repository) {
    fetchPancakes();
  }

  List<Pancake> get pancakes => _pancakes;

  Future<void> fetchPancakes() async {
    _pancakes = await _repository.getPancakes();
    notifyListeners();
  }

  void addPancake(String color, double price) async {
    final newPancake = Pancake(id: "temp", color: color, price: price);
    _pancakes.add(newPancake);
    notifyListeners();
    try {
      final addedPancake = await _repository.addPancake(color: color, price: price);
      _pancakes[_pancakes.indexOf(newPancake)] = addedPancake;
    } catch (e) {
      _pancakes.remove(newPancake);
    }
    notifyListeners();
  }

  void updatePancake(String id, String color, double price) async {
    final index = _pancakes.indexWhere((p) => p.id == id);
    if (index == -1) return;
    final oldPancake = _pancakes[index];
    _pancakes[index] = Pancake(id: id, color: color, price: price);
    notifyListeners();
    try {
      await _repository.updatePancake(id, color, price);
    } catch (e) {
      _pancakes[index] = oldPancake;
    }
    notifyListeners();
  }

  void deletePancake(String id) async {
    final pancakeToRemove = _pancakes.firstWhere((p) => p.id == id);
    _pancakes.remove(pancakeToRemove);
    notifyListeners();
    try {
      await _repository.deletePancake(id);
    } catch (e) {
      _pancakes.add(pancakeToRemove);
    }
    notifyListeners();
  }
}
