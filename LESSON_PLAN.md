Aula 01 - Vídeo 01 - Parte 05

**Atenção!**
Essa parte sofre do mesmo caso da anterior, uma preparação de tela que não tem ligação direta com NFC. 

**Problema:**
Agora que nossa tela está diagramada, precisamos dar comportamento a ela!

**Solução**
Para isso vamos criar um enum que vai definir o estado da tela, e baseado nele, vamos dar comportamento para os botões e mostrar algo na tela.

**Prática**
- Criar `enum NfcSubScreens`;
- Modularizar a tela subtela de welcome pra um `stl`;
- Criar `_buildCurrentScreen()` baseado em `NfcSubScreens`;
- Chamar `_buildCurrentScreen()` no lugar da tela de welcome;
- Dar comportamento para os botões baseado em `NfcSubScreens`;

**Gancho**
O gancho aqui é que vamos precisar saber se o dispositivo aceita ou não NFC para mandar para subtela de `readCard` ou `notValid`, e para isso precisaremos do pacote;