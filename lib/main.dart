import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const ExploreMundoApp());

class Destino {
  final String nome;
  final String local;
  final String imagem;
  final String descricao;
  final String destaque;
  final int preco;
  final double nota;
  final IconData icone;

  const Destino({
    required this.nome,
    required this.local,
    required this.imagem,
    required this.descricao,
    required this.destaque,
    required this.preco,
    required this.nota,
    required this.icone,
  });
}

const destinos = <Destino>[
  Destino(
    nome: 'Rio de Janeiro',
    local: 'Brasil',
    imagem: 'images/rio.png',
    descricao: 'Entre montanhas, mar e cultura, o Rio de Janeiro reúne praias, '
        'mirantes famosos, trilhas e atrações históricas. Explore a cidade '
        'maravilhosa com um roteiro cheio de possibilidades.',
    destaque: 'Praias e paisagens',
    preco: 1290,
    nota: 4.9,
    icone: Icons.beach_access,
  ),
  Destino(
    nome: 'Paris',
    local: 'França',
    imagem: 'images/paris.png',
    descricao: 'Passeie por ruas charmosas, conheça museus, admire a Torre '
        'Eiffel e descubra a gastronomia e a arquitetura da capital francesa.',
    destaque: 'Arte e gastronomia',
    preco: 4790,
    nota: 4.8,
    icone: Icons.museum,
  ),
  Destino(
    nome: 'Alpes Suíços',
    local: 'Suíça',
    imagem: 'images/alpes.png',
    descricao: 'Montanhas impressionantes, lagos e vilarejos alpinos formam '
        'o cenário perfeito para caminhadas, descanso e contato com a natureza.',
    destaque: 'Natureza e aventura',
    preco: 5890,
    nota: 4.9,
    icone: Icons.landscape,
  ),
  Destino(
    nome: 'Tóquio',
    local: 'Japão',
    imagem: 'images/toquio.png',
    descricao: 'Da tradição dos templos à tecnologia das grandes avenidas, '
        'Tóquio oferece experiências gastronômicas, culturais e urbanas únicas.',
    destaque: 'Cultura e tecnologia',
    preco: 6790,
    nota: 4.8,
    icone: Icons.location_city,
  ),
];

String formatarMoeda(int valor) {
  final s = valor.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buffer.write('.');
    buffer.write(s[i]);
  }
  return 'R\$ $buffer';
}

class ExploreMundoApp extends StatelessWidget {
  const ExploreMundoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007E91),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F8FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF073C51),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: const PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  String consulta = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.travel_explore, size: 28),
              SizedBox(width: 10),
              Text('Explore Mundo', style: TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xFFC7DCE4),
            indicatorColor: Color(0xFFFFD27D),
            tabs: [
              Tab(text: 'Destinos', icon: Icon(Icons.place_outlined)),
              Tab(text: 'Pacotes', icon: Icon(Icons.luggage_outlined)),
              Tab(text: 'Contato', icon: Icon(Icons.mail_outline)),
              Tab(text: 'Sobre nós', icon: Icon(Icons.info_outline)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _paginaDestinos(),
            const PaginaPacotes(),
            const PaginaContato(),
            const PaginaSobre(),
          ],
        ),
      ),
    );
  }

  Widget _paginaDestinos() {
    final filtrados = destinos.where((destino) {
      final texto = '${destino.nome} ${destino.local} ${destino.destaque}'
          .toLowerCase();
      return texto.contains(consulta.toLowerCase().trim());
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('Sua próxima aventura começa aqui',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w800, height: 1.14)),
        const SizedBox(height: 7),
        const Text('Descubra destinos, compare opções e planeje sua viagem.'),
        const SizedBox(height: 18),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () => abrirDestino(context, destinos[2]),
            child: SizedBox(
              height: 190,
              child: Stack(fit: StackFit.expand, children: [
                Image.asset(destinos[2].imagem, fit: BoxFit.cover),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xC4002639)],
                    ),
                  ),
                ),
                const Positioned(
                  left: 18,
                  right: 18,
                  bottom: 17,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DESTINO EM DESTAQUE',
                          style: TextStyle(
                              color: Color(0xFFFFD27D),
                              fontSize: 11,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.bold)),
                      Text('Explore os Alpes Suíços',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold)),
                      Text('Toque para conhecer',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
        const SizedBox(height: 18),
        TextField(
          onChanged: (texto) => setState(() => consulta = texto),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Pesquisar destino ou país',
          ),
        ),
        const SizedBox(height: 22),
        Text('Destinos para descobrir (${filtrados.length})',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        if (filtrados.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 28),
            child: Center(child: Text('Nenhum destino encontrado.')),
          ),
        for (final destino in filtrados) ...[
          Card(
            margin: const EdgeInsets.only(bottom: 15),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => abrirDestino(context, destino),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(destino.imagem,
                      height: 160, width: double.infinity, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(
                            child: Text(destino.nome,
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold)),
                          ),
                          const Icon(Icons.star, color: Color(0xFFFFB52E), size: 18),
                          const SizedBox(width: 3),
                          Text(destino.nota.toStringAsFixed(1)),
                        ]),
                        const SizedBox(height: 5),
                        Text('${destino.local} • ${destino.destaque}'),
                        const SizedBox(height: 9),
                        Text('Pacotes a partir de ${formatarMoeda(destino.preco)}',
                            style: const TextStyle(
                                color: Color(0xFF007E91),
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Valores e avaliações fictícios para demonstração acadêmica.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black54)),
        ),
      ],
    );
  }
}

void abrirDestino(BuildContext context, Destino destino) {
  Navigator.of(context).push(MaterialPageRoute<void>(
    builder: (_) => PaginaDestino(destino: destino),
  ));
}

class PaginaDestino extends StatefulWidget {
  final Destino destino;
  const PaginaDestino({super.key, required this.destino});

  @override
  State<PaginaDestino> createState() => _PaginaDestinoState();
}

class _PaginaDestinoState extends State<PaginaDestino> {
  final List<String> comentarios = [];

  Future<void> _reservar() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: 'Escolha a data de interesse',
    );
    if (!mounted || data == null) return;
    final dia = '${data.day.toString().padLeft(2, '0')}/'
        '${data.month.toString().padLeft(2, '0')}/${data.year}';
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Interesse registrado'),
        content: Text('Destino: ${widget.destino.nome}\nData: $dia\n\n'
            'Esta é uma simulação acadêmica. Nenhuma reserva foi realizada.'),
        actions: [TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Entendi'),
        )],
      ),
    );
  }

  Future<void> _comentar() async {
    var textoDigitado = '';
    final comentario = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sua avaliação'),
        content: TextField(
          onChanged: (texto) => textoDigitado = texto,
          maxLength: 180,
          maxLines: 3,
          decoration: const InputDecoration(hintText: 'Conte o que achou deste destino'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.pop(context, textoDigitado.trim()),
              child: const Text('Publicar')),
        ],
      ),
    );
    if (!mounted || comentario == null || comentario.isEmpty) return;
    setState(() => comentarios.add(comentario));
  }

  @override
  Widget build(BuildContext context) {
    final destino = widget.destino;
    const cor = Color(0xFF007E91);
    return Scaffold(
      appBar: AppBar(title: Text(destino.nome)),
      body: ListView(children: [
        Image.asset(destino.imagem,
            width: double.infinity, height: 255, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.all(22),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(destino.nome, style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(destino.local, style: const TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
              const Icon(Icons.star, color: Color(0xFFFFB52E)),
              const SizedBox(width: 4),
              Text(destino.nota.toStringAsFixed(1),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              _botaoColuna(cor, Icons.call, 'CONTATO', () => _informar(
                  'Contato', 'Visite a aba Contato para falar com a equipe fictícia.')),
              _botaoColuna(cor, Icons.near_me, 'LOCAL', () => _informar(
                  'Localização', '${destino.nome}, ${destino.local}')),
              _botaoColuna(cor, Icons.share, 'COMPARTILHAR', () async {
                await Clipboard.setData(ClipboardData(
                    text: 'Explore ${destino.nome} com a Explore Mundo!'));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Mensagem copiada para compartilhar.')));
                }
              }),
            ]),
            const SizedBox(height: 24),
            const Text('Sobre o destino', style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(destino.descricao, softWrap: true,
                style: const TextStyle(fontSize: 15, height: 1.5)),
            const SizedBox(height: 22),
            Card(child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                const Icon(Icons.luggage, color: cor),
                const SizedBox(width: 12),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Valor ilustrativo do pacote',
                        style: TextStyle(fontSize: 12)),
                    Text(formatarMoeda(destino.preco),
                        style: const TextStyle(fontSize: 21,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
                FilledButton(onPressed: _reservar,
                    child: const Text('Reservar')),
              ]),
            )),
            const SizedBox(height: 20),
            Row(children: [
              const Expanded(child: Text('Avaliações e comentários',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
              TextButton.icon(onPressed: _comentar,
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Avaliar')),
            ]),
            if (comentarios.isEmpty)
              const Text('Seja a primeira pessoa a deixar uma avaliação '
                  'nesta demonstração.'),
            for (final comentario in comentarios)
              Card(child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: const Text('Visitante'),
                subtitle: Text(comentario),
              )),
            const SizedBox(height: 12),
            const Text('Reservas e comentários ficam apenas nesta sessão. '
                'Este aplicativo não possui servidor.',
                style: TextStyle(fontSize: 12, color: Colors.black54)),
          ]),
        ),
      ]),
    );
  }

  Widget _botaoColuna(Color cor, IconData icone, String texto, VoidCallback acao) {
    return InkWell(
      onTap: acao,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icone, color: cor, size: 27),
          const SizedBox(height: 7),
          Text(texto, style: TextStyle(fontSize: 10,
              fontWeight: FontWeight.w600, color: cor)),
        ]),
      ),
    );
  }

  void _informar(String titulo, String mensagem) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Fechar'),
        )],
      ),
    );
  }
}

class PaginaPacotes extends StatelessWidget {
  const PaginaPacotes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('Pacotes de viagem', style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(height: 7),
        const Text('Ofertas ilustrativas para explorar cada destino.'),
        const SizedBox(height: 16),
        for (final destino in destinos)
          Card(
            margin: const EdgeInsets.only(bottom: 13),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(destino.imagem,
                      width: 90, height: 100, fit: BoxFit.cover),
                ),
                const SizedBox(width: 13),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(destino.nome, style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17)),
                    Text(destino.destaque,
                        style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    Text('Desde ${formatarMoeda(destino.preco)}',
                        style: const TextStyle(fontWeight: FontWeight.bold,
                            color: Color(0xFF007E91))),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => abrirDestino(context, destino),
                        child: const Text('Ver detalhes'),
                      ),
                    ),
                  ],
                )),
              ]),
            ),
          ),
        const Text('Preços de demonstração, sem validade comercial.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, fontSize: 12)),
      ],
    );
  }
}

class PaginaContato extends StatefulWidget {
  const PaginaContato({super.key});

  @override
  State<PaginaContato> createState() => _PaginaContatoState();
}

class _PaginaContatoState extends State<PaginaContato> {
  final chaveFormulario = GlobalKey<FormState>();
  final nome = TextEditingController();
  final email = TextEditingController();
  final mensagem = TextEditingController();

  @override
  void dispose() {
    nome.dispose();
    email.dispose();
    mensagem.dispose();
    super.dispose();
  }

  void _enviar() {
    if (!(chaveFormulario.currentState?.validate() ?? false)) return;
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mensagem registrada'),
        content: const Text('Simulação concluída! Esta mensagem não foi '
            'enviada de verdade, pois não existe um servidor conectado.'),
        actions: [TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Entendi'),
        )],
      ),
    );
    nome.clear();
    email.clear();
    mensagem.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(20), children: [
      const Text('Fale com a gente', style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold)),
      const SizedBox(height: 7),
      const Text('Envie sua dúvida no formulário demonstrativo.'),
      const SizedBox(height: 20),
      Form(key: chaveFormulario, child: Column(children: [
        TextFormField(
          controller: nome,
          decoration: const InputDecoration(labelText: 'Seu nome',
              prefixIcon: Icon(Icons.person_outline)),
          validator: (v) => (v == null || v.trim().isEmpty)
              ? 'Informe seu nome' : null,
        ),
        const SizedBox(height: 13),
        TextFormField(
          controller: email,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(labelText: 'Seu e-mail',
              prefixIcon: Icon(Icons.alternate_email)),
          validator: (v) => (v == null || !v.contains('@') || !v.contains('.'))
              ? 'Informe um e-mail válido' : null,
        ),
        const SizedBox(height: 13),
        TextFormField(
          controller: mensagem,
          maxLines: 5,
          decoration: const InputDecoration(labelText: 'Mensagem',
              alignLabelWithHint: true),
          validator: (v) => (v == null || v.trim().isEmpty)
              ? 'Escreva uma mensagem' : null,
        ),
        const SizedBox(height: 18),
        SizedBox(width: double.infinity,
          child: FilledButton.icon(
            onPressed: _enviar,
            icon: const Icon(Icons.send),
            label: const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Enviar mensagem'),
            ),
          ),
        ),
      ])),
    ]);
  }
}

class PaginaSobre extends StatelessWidget {
  const PaginaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(22), children: [
      const Icon(Icons.travel_explore, size: 80, color: Color(0xFF007E91)),
      const SizedBox(height: 15),
      const Text('Explore Mundo', textAlign: TextAlign.center,
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text('Seu mundo, sua próxima história.',
          textAlign: TextAlign.center),
      const SizedBox(height: 26),
      const Text('Quem somos', style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      const Text('A Explore Mundo é uma agência fictícia criada para o '
          'trabalho prático da disciplina Desenvolvimento de Aplicativos '
          'Móveis com Flutter, da Estácio. O projeto reúne recursos '
          'de navegação, pesquisa e apresentação de destinos turísticos.'),
      const SizedBox(height: 23),
      const ListTile(
        leading: Icon(Icons.devices, color: Color(0xFF007E91)),
        title: Text('Interface responsiva'),
        subtitle: Text('Layouts com Row, Column, Expanded, Stack e ListView.'),
      ),
      const ListTile(
        leading: Icon(Icons.search, color: Color(0xFF007E91)),
        title: Text('Busca interativa'),
        subtitle: Text('Filtragem dos destinos enquanto o usuário digita.'),
      ),
      const ListTile(
        leading: Icon(Icons.star, color: Color(0xFF007E91)),
        title: Text('Avaliações demonstrativas'),
        subtitle: Text('Comentários ficam na memória durante a sessão.'),
      ),
      const SizedBox(height: 18),
      const Text('Aviso: valores, avaliações, reservas e contatos são '
          'simulados. Não há compras, pagamentos ou armazenamento remoto.',
          style: TextStyle(fontSize: 12, color: Colors.black54)),
    ]);
  }
}
