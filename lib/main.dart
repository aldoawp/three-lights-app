import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tlb_app/services/supabase_service.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  SupabaseService.instantiateSupabase();

  runApp(const MyApp());
}
