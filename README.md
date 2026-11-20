# Explore Mundo — Trabalho Prático DGT2812

Projeto acadêmico individual da disciplina **Desenvolvimento de Aplicativos Móveis com Flutter**, da Estácio. O aplicativo apresenta uma agência de viagens fictícia, com destinos, busca, pacotes, formulários demonstrativos e avaliações locais.

**Aluno:** Luis Fellipe de Moraes Rodrigues  
**Disciplina:** DGT2812 — Desenvolvimento de Aplicativos Móveis com Flutter  
**Entrega:** repositório Git com documentação PDF.

## O que foi desenvolvido

- Banner interativo com destino em destaque, usando `Stack` e `Image.asset`.
- Navegação por quatro abas: Destinos, Pacotes, Contato e Sobre nós.
- Pesquisa em tempo real por destino, país ou característica.
- Cards de destinos e pacotes, notas e preços ilustrativos.
- Página detalhada para cada destino, com descrição e ações de contato, localização e compartilhamento.
- Data de interesse para reserva **simulada**, sem pagamentos ou confirmação real.
- Comentários inseridos na memória do aplicativo durante a sessão.
- Formulário de contato com validação **demonstrativa**, sem envio por e-mail.
- `MaterialApp`, `Scaffold`, `AppBar`, `Row`, `Column`, `Expanded`, `Stack`, `ListView`, `Container`, `Text`, `Icon`, `Card`, `TextField` e `Navigator`.
- Ilustrações locais em `images/`: não dependem de internet nem de serviços externos.

**Importante:** preços, avaliações, pacotes, reservas e contatos são fictícios. Este projeto não integra servidor, banco de dados, pagamentos ou reservas de verdade.

## Requisitos

- Flutter SDK, versão com Dart >= 3.5
- Android Studio e/ou Visual Studio Code
- Emulador Android, celular físico ou Chrome para executar o app
- Git para enviar o repositório

## Como executar

Se você recebeu somente este kit de código-fonte, crie primeiro o esqueleto oficial do Flutter:

```bash
flutter doctor
flutter create explore_mundo
```

Copie deste kit as pastas `lib`, `images`, `docs` e `test` e o arquivo `pubspec.yaml` para dentro de `explore_mundo`, substituindo os arquivos equivalentes criados pelo Flutter. O resultado deve conter `android/`, `lib/`, `images/`, `pubspec.yaml`, `test/` e `docs/`.

Em seguida:

```bash
cd explore_mundo
flutter pub get
flutter run
```

Para executar em um emulador Android, inicie o emulador primeiro no **Device Manager** do Android Studio. Se houver mais de um dispositivo, use `flutter devices` e `flutter run -d <id-do-dispositivo>`.

Opcionalmente, para conferir no navegador:

```bash
flutter run -d chrome
```

## Conferências antes da entrega

```bash
flutter analyze
flutter test
```

Teste também: as quatro abas, pesquisa por Paris, abrir cada destino, selecionar uma data de reserva fictícia, escrever um comentário, compartilhar/copy e validar o formulário de contato.

> O código foi preparado para a atividade. **A execução e os testes no Flutter devem ser feitos no seu computador**, pois o ambiente usado para preparar este kit não disponibiliza Flutter/Dart para compilar o app.

## Estrutura importante

```text
explore_mundo/
├─ android/                  # Criado pelo flutter create
├─ web/                      # Criado pelo flutter create (se habilitado)
├─ lib/
│  └─ main.dart
├─ images/
│  ├─ rio.png
│  ├─ paris.png
│  ├─ alpes.png
│  └─ toquio.png
├─ docs/
│  └─ Documentacao_Explore_Mundo.pdf
├─ test/
│  └─ widget_test.dart
├─ pubspec.yaml
└─ README.md
```

## Entrega no GitHub

1. Rode o app e capture prints reais do emulador; se possível, acrescente os prints em `docs/evidencias/` antes do envio.
2. Crie um repositório GitHub (por exemplo, `estacio-explore-mundo-flutter`).
3. Faça o commit dos arquivos do projeto, inclusive `docs/Documentacao_Explore_Mundo.pdf` e `images/`.
4. Compartilhe o **link do repositório** na aba **Trabalhos** da Sala de Aula Virtual Estácio, não apenas o ZIP.

### Usando comandos Git na pasta do projeto

```bash
git init
git add .
git commit -m "Entrega do trabalho pratico DGT2812 - Explore Mundo"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git
git push -u origin main
```

Substitua os campos acima pelo endereço real do repositório. Se o GitHub solicitar autenticação, siga o fluxo oficial de login.

## Créditos de imagem

As quatro ilustrações foram produzidas especificamente para este protótipo acadêmico, sem uso de bancos comerciais de fotografias.
