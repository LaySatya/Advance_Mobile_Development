import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repositories/pancake_repository.dart';
import 'providers/pancake_provider.dart';
import 'ui/pancake_app.dart';

void main() {
  final PancakeRepository pancakeRepository = FirebasePancakeRepository();
  runApp(
    ChangeNotifierProvider(
      create: (context) => PancakeProvider(pancakeRepository),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PancakeApp()),
    ),
  );
}