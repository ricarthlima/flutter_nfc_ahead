Aula 01 - Vídeo 01 - Parte 03

**Problema:**
Agora precisamos de uma tela para fazer o cadastro da autenticação via NFC.

**Solução**
Para isso, o primeiro passo é criar uma nova tela e chama-la depois de `LoginScreen` caso aquele dado `isFirstTime` seja verdadeiro.

**Prática**
- Criar `ui/nfc_screen.dart` com um `stf`
- Configurar rota do `nfc` em `main`
- Fazer com que `LoginScreen` mande para `HomeScreen` ou `NfcScreen` a depender do resultado da consulta de `LOcalDataManager.isFirstTime()`