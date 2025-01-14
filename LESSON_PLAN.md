Aula 01 - Vídeo 01 - Parte 09

**Problema**
Agora que somos capazes de ter em mãos o identificador único de nossa tag NFC. Chegou a hora de salvarmos essa informação localmente para podermos usar na autenticação depois.

**Solução**
Para isso vamos lá no no nosso LocalDataManager para criar dois métodos, um de salvamento e outro de obtenção.

**Prática**
Sem segredo aqui:
```dart
  Future<void> saveNfcTagId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PrefsKeys.tagID, id);
  }

  Future<String> readNfcTagId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PrefsKeys.tagID) ?? "";
  }
```