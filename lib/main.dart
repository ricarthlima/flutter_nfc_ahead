import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/home_screen.dart';
import 'package:flutter_banco_douro/ui/login_screen.dart';
import 'package:flutter_banco_douro/ui/nfc_read_screen.dart';
import 'package:flutter_banco_douro/ui/nfc_screen.dart';

void main() {
  runApp(const BancoDouroApp());
}

class BancoDouroApp extends StatelessWidget {
  const BancoDouroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "login": (context) => const LoginScreen(),
        "home": (context) => const HomeScreen(),
        "nfc": (context) => const NfcScreen(),
        "nfc_read": (context) => const NfcReadScreen(),
      },
      initialRoute: "login",
    );
  }
}
