import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // SupabaseService.instantiateSupabase();
  await di.init();

  runApp(const MyApp());
}
