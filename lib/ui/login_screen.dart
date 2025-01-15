import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/data/local_data_manager.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/banner.png"),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/images/stars.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 128),
                Image.asset(
                  "assets/images/logo.png",
                  width: 120,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      "Sistema de Gestão de Contas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("E-mail"),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text("Senha"),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        routeScreen(context);
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColor.orange,
                        ),
                      ),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  routeScreen(BuildContext context) async {
    bool isFirstTime = await LocalDataManager().isFirstTime();

    if (!context.mounted) return;

    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, "nfc");
    } else {
      bool hasTagId = await LocalDataManager().readNfcTagId() != "";

      if (!context.mounted) return;

      if (hasTagId) {
        Navigator.pushNamed(context, "nfc_read");
      } else {
        Navigator.pushReplacementNamed(context, "home");
      }
    }
  }
}
