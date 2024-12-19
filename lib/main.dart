import 'package:flutter/material.dart';

void main() {
  runApp(const RabbitCareApp());
}

class RabbitCareApp extends StatelessWidget {
  const RabbitCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuidados com Coelhos',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFFDEEF4),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC1E3),
        title: const Text(
          'Cuidados com Coelhos 🐇',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(
            child: Text(
              'Bem-vindo ao guia de cuidados com coelhos! 🐰',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8A2E6C),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Escolha um tópico para aprender mais sobre como cuidar bem do seu coelho:',
            style: TextStyle(fontSize: 16, color: Color(0xFF4A4A4A)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildTopicCard(
            context,
            'Alimentação 🍎',
            'Descubra o que seu coelho deve comer.',
            const FeedingPage(),
          ),
          _buildTopicCard(
            context,
            'Higiene 🧼',
            'Saiba como manter seu coelho limpo.',
            const HygienePage(),
          ),
          _buildTopicCard(
            context,
            'Saúde 🏥',
            'Dicas para garantir a saúde do seu coelho.',
            const HealthPage(),
          ),
          _buildTopicCard(
            context,
            'Habitat 🏡',
            'Como criar um lar perfeito para seu coelho.',
            const HabitatPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard(BuildContext context, String title, String subtitle, Widget page) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.pets, color: Color(0xFFFFC1E3)),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8A2E6C)),
        ),
        subtitle: Text(subtitle, style: const TextStyle(color: Color(0xFF4A4A4A))),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF8A2E6C)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}

class FeedingPage extends StatelessWidget {
  const FeedingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTopicPage(
      context,
      title: 'Alimentação 🍎',
      content: '''
      A alimentação do seu coelho deve incluir:
      - 🌾 Feno de qualidade como alimento principal.
      - 🥕 Legumes frescos como cenoura, brócolis e folhas verdes.
      - 💧 Água fresca sempre disponível.
      - ❌ Evitar alimentos processados, doces e frutas em excesso.
      ''',
    );
  }
}

class HygienePage extends StatelessWidget {
  const HygienePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTopicPage(
      context,
      title: 'Higiene 🧼',
      content: '''
      Para manter seu coelho limpo:
      - 🐇 Escove os pelos regularmente para evitar nós.
      - 👂 Limpe as orelhas e olhos com cuidado.
      - 🚫 Não dê banho em coelhos, pois pode ser estressante para eles.
      - 🧹 Limpe a gaiola ou espaço do coelho diariamente.
      ''',
    );
  }
}

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTopicPage(
      context,
      title: 'Saúde 🏥',
      content: '''
      Cuidados com a saúde do seu coelho:
      - 🩺 Consulte um veterinário especializado regularmente.
      - 🦷 Verifique dentes e garras para evitar crescimento excessivo.
      - 👀 Observe mudanças de comportamento e apetite.
      - 💉 Vacine seu coelho, se recomendado pelo veterinário.
      ''',
    );
  }
}

class HabitatPage extends StatelessWidget {
  const HabitatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTopicPage(
      context,
      title: 'Habitat 🏡',
      content: '''
      Criação de um ambiente ideal para coelhos:
      - 🏠 Ofereça uma gaiola ou cercado espaçoso.
      - 🛏️ Inclua um local para esconderijo e descanso.
      - 🧶 Utilize material macio e seguro para o chão.
      - 🐾 Garanta acesso a áreas para brincar e explorar.
      ''',
    );
  }
}

Widget _buildTopicPage(BuildContext context, {required String title, required String content, String? image}) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xFFFFC1E3),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (image != null)
            Image.asset(image, height: 200),
          const SizedBox(height: 20),
          Text(
            content,
            style: const TextStyle(fontSize: 16, color: Color(0xFF4A4A4A), height: 1.5),
          ),
        ],
      ),
    ),
  );
}
