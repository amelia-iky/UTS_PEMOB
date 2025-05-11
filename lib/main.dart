import 'package:flutter/material.dart';
import 'package:flutter_utspemob_ameng/login_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Penting untuk operasi async
  await initializeDateFormatting(
    'id',
    null,
  ); // Inisialisasi lokal 'id' (Indonesia)

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Koperasi Undiksha",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(), // Bisa diganti dengan SettingPage() untuk preview
    );
  }
}
