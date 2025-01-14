Aula 01 - Vídeo 01 - Parte 12

**Atenção**
Aquelas telas que não precisam ser feitas em vídeo.

**Problema**
Cadastro tá pronto! 
Só falta dar um tapa nessa tela de finalização né?

**Solução**
Para isso vamos apenas adicionar um ícone de check e um texto amigável. É uma boa oportunidade também para mudar a label do botão de continuar caso estejamos na subtela de finalizar ou de não válido.

**Prática**
- Segue sem segredo:
```dart
Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Icon(
            Icons.check,
            color: AppColor.orange,
            size: 128,
          ),
          Text(
            "Seu douradinho foi registrado! :D",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
```
- E no botão:
```dart
(_currentSubScreen == _NfcSubScreens.finished ||
                              _currentSubScreen == _NfcSubScreens.notValid)
                          ? "Finalizar"
                          : "Continuar",
```