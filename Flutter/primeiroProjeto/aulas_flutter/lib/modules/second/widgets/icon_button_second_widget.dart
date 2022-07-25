import 'package:flutter/material.dart';

class IconButtonSecondWidget extends StatelessWidget {
  const IconButtonSecondWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero, // zera o "padrão" que vem
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          size: 100,
          color: Colors.white,
        ));
  }
}
