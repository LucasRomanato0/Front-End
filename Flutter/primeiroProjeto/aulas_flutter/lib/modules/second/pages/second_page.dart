import 'package:flutter/material.dart';
import '../widgets/icon_button_second_widget.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int numero = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        const IconButtonSecondWidget(),
        const SizedBox(
          height: 300,
        ),
        Text(
          numero.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 50),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                numero++;
              });
            },
            icon: const Icon(
              Icons.add,
              size: 100,
              color: Colors.white,
            ))
      ]),
    );
  }
}
