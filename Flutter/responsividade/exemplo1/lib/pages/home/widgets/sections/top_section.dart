import 'package:exemplo1/breakpoints.dart';
import 'package:exemplo1/pages/home/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        if (maxWidth >= 1200) {
          // mantém o mesmo formato da imagem
          return AspectRatio(
            aspectRatio: 3.2,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 3.4,
                  child: Image.network(
                    'https://images.pexels.com/photos/892757/pexels-photo-892757.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w940',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 50,
                  right: 800,
                  top: 50,
                  child: Card(
                    color: Colors.black,
                    elevation: 8,
                    child: Container(
                      padding: const EdgeInsets.all(22),
                      width: 450,
                      child: const Column(
                        children: [
                          Text(
                            'Responsividade no Flutter',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Aprendendo responsividade no Flutter web e mobile',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          CustomSearchField(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        if (maxWidth >= mobileBreakPoint) {
          return SizedBox(
            height: 320,
            child: Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    'https://images.pexels.com/photos/892757/pexels-photo-892757.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w940',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Card(
                    color: Colors.black,
                    elevation: 8,
                    child: Container(
                      padding: const EdgeInsets.all(22),
                      width: 350,
                      child: const Column(
                        children: [
                          Text(
                            'Responsividade no Flutter',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Aprendendo responsividade no Flutter web e mobile',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          CustomSearchField(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
