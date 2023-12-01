import 'package:exemplo1/pages/home/widgets/app_bar/web_app_bar_responsive_content.dart';
import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.black,
      toolbarHeight: 72,
      title: Row(
        children: [
          const Text("Flutter", style: TextStyle(color: Colors.white)),
          const SizedBox(width: 32),
          const WebAppBarResponsiveContent(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
          const SizedBox(width: 24),
          SizedBox(
            height: 38,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
              ),
              child: const Text(
                "Fazer Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 38,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Cadastre-se",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
