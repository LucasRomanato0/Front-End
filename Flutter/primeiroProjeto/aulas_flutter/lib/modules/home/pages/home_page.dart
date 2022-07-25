import 'package:aulas_flutter/modules/home/widgets/coffee_shop_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listString = ['Capuccino', 'Café', 'Leite'];
    return Scaffold(
      // "andaime", uma coisa empilhada com a outra
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        elevation: 0,
        actions: const [
          // actions = ícone na direita
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
        leading: const Icon(
          // leading  = ícone na esquerda
          Icons.menu,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Hoje é um ótimo dia para tomar um café!',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CoffeeShopWidget(title: listString[index]),
                  );
                },
                itemCount: 3,
              ),
            ),
            // TextButton(onPressed: () {}, child: Text('Olá Vitinho')),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.abc_outlined,
            //     size: 40,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
