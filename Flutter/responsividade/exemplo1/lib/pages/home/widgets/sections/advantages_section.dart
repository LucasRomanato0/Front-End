import 'package:flutter/material.dart';

class AdvantagesSection extends StatelessWidget {
  const AdvantagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildAdvantages(String title, String subtitle) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: Colors.white, size: 50),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(subtitle, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ],
      );
    }

    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: [
        buildAdvantages('Curso de responsividade', 'Mobile'),
        buildAdvantages('Curso de responsividade', 'Tablet'),
        buildAdvantages('Curso de responsividade', 'Web'),
      ],
    );
  }
}
