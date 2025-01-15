Aula 01 - Vídeo 01 - Parte 13

**Problema**
Faltou um detalhezinho na nossa lógica né?  Se a pessoa já cadastrou o cartão (ou se o dispositivo não tem NFC disponível), não podemos mais ir para essa tela de configuração depois da de login né?


**Solução**
Para resolver esse problema vamos preparar nosso código para salvar a informação com o `shared_preferences` e aplicar essa lógica de salvamento tanto na tela `finish` quanto na `notValid`;

**Prática**
- Método `saveFirstTime` em `LocalDataManager`;
- Método `saveNotFirstTimeAnymore` em `NfcScreen`;
- Usar método no `buttonNext` da tela `finish` e na tela `notValid`;