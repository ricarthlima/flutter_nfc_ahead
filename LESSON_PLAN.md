Aula 01 - Vídeo 01 - Parte 06

**Problema:**
Precisamos saber se o dispositivo é compatível com NFC.

**Solução**
Para isso já vamos usar o plugin `nfc_manager`, então vamos instalá-lo e configurá-lo.

**Prática**
- `flutter pub add nfc_manager`
- Código e discussão sobre no Android Manifest
```
     <!-- Permissões necessárias -->
    <uses-permission android:name="android.permission.NFC" />

    <!-- Declaração de recursos -->
    <uses-feature android:name="android.hardware.nfc" android:required="true" />
    
```