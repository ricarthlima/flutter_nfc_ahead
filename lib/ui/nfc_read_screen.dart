import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/data/local_data_manager.dart';
import 'package:flutter_banco_douro/ui/nfc_screen.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcReadScreen extends StatefulWidget {
  const NfcReadScreen({super.key});

  @override
  State<NfcReadScreen> createState() => _NfcReadScreenState();
}

class _NfcReadScreenState extends State<NfcReadScreen> {
  bool isStartedRead = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            _buildSubScreen(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  _resetDataAndBack();
                },
                child: const Text("Perdi meu cartão ou estou tendo problemas."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubScreen() {
    if (isStartedRead) {
      return const NfcReadSubScreen();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          Image.asset(
            "assets/images/credit_card.png",
            width: 256,
          ),
          ElevatedButton(
            onPressed: () {
              _startReadNfc();
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColor.orange),
            ),
            child: const Text(
              "Iniciar leitura",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const Text(
            "Tenha em mãos seu douradinho!",
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
  }

  _startReadNfc() {
    setState(() {
      isStartedRead = true;
    });
    NfcManager.instance.startSession(
      onDiscovered: (tag) async {
        await NfcManager.instance.stopSession();

        String tagId = await LocalDataManager().readNfcTagId();
        if (tag.data["nfca"]["identifier"].toString() == tagId) {
          if (!mounted) return;
          Navigator.pushReplacementNamed(context, "home");
        } else {
          showWrongCardDialog();
        }
      },
    );
  }

  void showWrongCardDialog() {
    setState(() {
      isStartedRead = false;
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Atenção"),
          content: const Text(
              "O cartão aproximado não é o cadastrado, tente novamente."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            )
          ],
        );
      },
    );
  }

  void _resetDataAndBack() async {
    await LocalDataManager().saveFirstTime(isFirstTime: true);
    await NfcManager.instance.stopSession();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, "login");
  }
}
