import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcScreen extends StatefulWidget {
  const NfcScreen({super.key});

  @override
  State<NfcScreen> createState() => _NfcScreenState();
}

class _NfcScreenState extends State<NfcScreen> {
  _NfcSubScreens _currentSubScreen = _NfcSubScreens.welcome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            _buildCurrentScreen(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32,
                children: [
                  TextButton(
                    onPressed: () {
                      onBackButtonClicked();
                    },
                    child: const Text(
                      "Voltar",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onNextButtonClicked();
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColor.orange),
                    ),
                    child: const Text(
                      "Continuar",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onBackButtonClicked() {
    switch (_currentSubScreen) {
      case _NfcSubScreens.welcome:
        Navigator.pushReplacementNamed(context, "login");
        break;
      case _NfcSubScreens.notValid:
        setState(() {
          _currentSubScreen = _NfcSubScreens.welcome;
        });
        break;
      case _NfcSubScreens.readCard:
        setState(() {
          _currentSubScreen = _NfcSubScreens.welcome;
        });
        break;
      case _NfcSubScreens.finished:
        setState(() {
          _currentSubScreen = _NfcSubScreens.welcome;
        });
        break;
    }
  }

  onNextButtonClicked() {
    switch (_currentSubScreen) {
      case _NfcSubScreens.welcome:
        verifyNfcAvailability().then(
          (isAvailable) {
            if (isAvailable) {
              setState(() {
                _currentSubScreen = _NfcSubScreens.readCard;
              });
            } else {
              _currentSubScreen = _NfcSubScreens.notValid;
            }
          },
        );
      case _NfcSubScreens.notValid:
        Navigator.pushReplacementNamed(context, "home");
        break;
      case _NfcSubScreens.readCard:
        setState(() {
          _currentSubScreen = _NfcSubScreens.finished;
        });
        break;
      case _NfcSubScreens.finished:
        Navigator.pushReplacementNamed(context, "home");
        break;
    }

    setState(() {});
  }

  Widget _buildCurrentScreen() {
    switch (_currentSubScreen) {
      case _NfcSubScreens.welcome:
        return const _NfcWelcomeScreen();
      case _NfcSubScreens.notValid:
        return const _NfcNotValidScreen();
      case _NfcSubScreens.readCard:
        return const _NfcReadScreen();
      case _NfcSubScreens.finished:
        return const _NfcFinishScreen();
    }
  }

  Future<bool> verifyNfcAvailability() async {
    return NfcManager.instance.isAvailable();
  }
}

enum _NfcSubScreens {
  welcome,
  notValid,
  readCard,
  finished,
}

class _NfcWelcomeScreen extends StatelessWidget {
  const _NfcWelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        Image.asset(
          "assets/images/credit_card.png",
          width: 256,
        ),
        const Text(
          "Mais segurança!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Para segurança, vamos configurar uma segunda etapa de autenticação!",
          textAlign: TextAlign.center,
        ),
        const Text(
          "Tenha em mãos seu cartão do Banco D'Ouro.",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _NfcNotValidScreen extends StatelessWidget {
  const _NfcNotValidScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("NFC não disponível"),
    );
  }
}

class _NfcReadScreen extends StatelessWidget {
  const _NfcReadScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Ler cartão"),
    );
  }
}

class _NfcFinishScreen extends StatelessWidget {
  const _NfcFinishScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Finalizar"),
    );
  }
}
