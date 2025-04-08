import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padaria App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const PadariaHomePage(title: 'Nossa Padaria'),
    );
  }
}

class ProdutoPadaria {
  final String nome;
  final double preco;
  final String imagem;

  ProdutoPadaria({required this.nome, required this.preco, required this.imagem});
}

class PadariaHomePage extends StatelessWidget {
  const PadariaHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final List<ProdutoPadaria> produtos = [
      ProdutoPadaria(nome: 'Pão Francês', preco: 0.75, imagem: 'assets/pao_frances.jpg'),
      ProdutoPadaria(nome: 'Croissant', preco: 5.50, imagem: 'assets/croissant.jpg'),
      ProdutoPadaria(nome: 'Bolo de Chocolate', preco: 35.90, imagem: 'assets/bolo_chocolate.jpg'),
      ProdutoPadaria(nome: 'Rosquinha', preco: 3.25, imagem: 'assets/rosquinha.jpg'),
      ProdutoPadaria(nome: 'Pão de Queijo', preco: 2.50, imagem: 'assets/pao_queijo.jpg'),
      ProdutoPadaria(nome: 'Sonho', preco: 4.75, imagem: 'assets/sonho.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Produtos Disponíveis',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  return _buildProdutoCard(context, produtos[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProdutoCard(BuildContext context, ProdutoPadaria produto) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[200],
              child: Center(
                child: Icon(Icons.bakery_dining, size: 64, color: Colors.brown),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produto.nome,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'R\$ ${produto.preco.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}