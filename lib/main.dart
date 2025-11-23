import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:territory_capture/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


// With shorthands
Row(
  mainAxisAlignment: .spaceBetween,
  crossAxisAlignment: .center,
)

// Without shorthands
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
)

// With shorthands
final mode = .dark;

// Without shorthands
final mode = Brightness.dark;