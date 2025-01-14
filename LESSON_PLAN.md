Aula 01 - Vídeo 01 - Parte 11

**Problema**
Agora que somos capazes de salvar a tag localmente, só falta salvar!

**Solução**
Para isso vamos fazer a chamada de `saveNfcTagId` dentro do nosso `startSession` e, logo na sequência, transferir a pessoa usuária para tela de finalização e liberar o botão de continuar.

**Prática**
Sem segredo aqui também:
```dart
  return NfcManager.instance.startSession(
      onDiscovered: (tag) async {
        LocalDataManager()
            .saveNfcTagId(tag.data["nfca"]["identifier"].toString());
        _currentSubScreen = _NfcSubScreens.finished;
        isReadingNfc = false;
        setState(() {});
      },
    );
```