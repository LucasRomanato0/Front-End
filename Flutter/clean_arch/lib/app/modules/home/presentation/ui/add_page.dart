import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar contato'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nome Completo'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Renan Zika',
              ),
            ),
            const SizedBox(height: 10),
            //
            const Text('E-mail'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'renanzika99@uol.com',
              ),
            ),
            const SizedBox(height: 10),
            //
            const Text('Telefone'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: '(11) 99999-9999',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text('Salvar')),
          ],
        ),
      ),
    );
  }
}
