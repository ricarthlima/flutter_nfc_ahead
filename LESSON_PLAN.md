Aula 01 - Vídeo 01 - Parte 14

**Atenção**
Essa pode se encaixar naquele esquema das telas prontas também.

**Problema**
Só que cadastrar não é o suficiente né? É preciso também verificar, na hora de fazer o login, qual foi o ID cadastrado!

**Solução**
Para isso vamos começar criando uma tela que será usada depois da tela de login caso `isFirstTime` seja falso, e se existir alguma `tagId`;

**Prática**
- Criar `stf` com uma estrutura para `NfcReadScreen`;
- Adicionar `NfcReadScreen` em uma nova rota em `main`;
- Na `LoginScreen` rotear para ir para nova tela caso `nfcTagId` seja diferente de nulo.