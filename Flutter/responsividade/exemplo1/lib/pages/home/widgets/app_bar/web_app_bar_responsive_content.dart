import 'package:flutter/material.dart';

class WebAppBarResponsiveContent extends StatelessWidget {
  const WebAppBarResponsiveContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.grey[600]!),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 4),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey[500],
                        ),
                        onPressed: () {},
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pesquise alguma coisa aqui",
                            isCollapsed: true, // diminui a área de toque
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (constraints.maxWidth >= 400) ...[
                const SizedBox(width: 32),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  child: const Text(
                    "Aprender",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              if (constraints.maxWidth >= 500) ...[
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  child: const Text(
                    "Flutter",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
