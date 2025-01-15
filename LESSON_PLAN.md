Aula 01 - Vídeo 01 - Parte 15

**Problema**
Agora que a tela está praticamente pronta, falta só fazer a lógica de leitura e comparação.

**Solução**
Para isso, vamos usar o `NfcManager` para iniciar a leitura, e o `LocalDataManager` para recuperar o id salvo.

**Prática**
- Começar a ler ao clicar em iniciar;
- Parar de ler assim que detectar uma leitura;
- Se a tag bater com a gravada, mandar para `HomeScreen`;
- Se não bater, mostrar um dialog e voltar para o inicio da detecção;