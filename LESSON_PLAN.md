Aula 01 - Vídeo 01 - Parte 16

**Problema**
Mas o que acontece se eu perder o cartão, ou o sensor de NFC do meu dispositivo der defeito?

**Solução**
É pensando nisso que esse botão de ajuda tá logo abaixo. Vamos fazer com que ele limpe as informações para a pessoa voltar para aquela situação de cadastrar um novo cartão lá no começo.

**Prática**
- Criar método `_resetDataAndBack` que limpa o `isFirstTime`, para a leitura caso ela esteja ativa, e volta para `LoginScreen`;
- Atribuir método ao botão de "Estou tendo problemas".

(OBS.: Em todo o discurso desse curso é importante dizer que o projeto é didático, a gente não estaria pensando na segurança de um banco real)