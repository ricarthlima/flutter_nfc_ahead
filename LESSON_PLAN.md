Aula 01 - Vídeo 01 - Parte 07

**Problema:**
Precisamos saber se vamos mandar a pessoa usuária para tela `NotValid` ou `Read` dependendo se o dispositivo dela é capaz ou não de ler NFC.

E é uma boa oportunidade de pelo menos rascunharmos essas outras telas além da welcome!

**Solução**
Para isso, vamos criar um método que usa o NfcManager para fazer essa verificação. E também vamos criar versões simples da próxima tela apenas para poder testar.


**Prática**
- Criar função `verifyNfcAvailability()`;
- Verificar na `welcome` do `nextButton`;
- Boa oportunidade para criar `stl` dos outros casos provisoriamente e configurar em `_buildCurrentScreen`;
- Testar, no emulador vai mandar para `NotValid` e no dispositivo físico vai para `ReadCard` e isso é lindo.