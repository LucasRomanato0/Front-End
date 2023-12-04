import 'package:exemplo1/breakpoints.dart';
import 'package:flutter/material.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, // tamanho máximo do container
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: constraints.maxWidth >= tabletBreakPoint ? 0 : 16,
          ),
          // vai encolher o gridview para o tamanho do conteúdo
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              height: 300,
              color: Colors.red,
            );
          },
        );
      },
    );
  }
}
