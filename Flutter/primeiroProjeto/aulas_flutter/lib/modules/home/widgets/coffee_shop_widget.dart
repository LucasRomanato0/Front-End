import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../second/pages/second_page.dart';

class CoffeeShopWidget extends StatelessWidget {
  final String title;
  const CoffeeShopWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/ronaldinho.jpg';
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          elevation: MaterialStateProperty.all(10)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const SecondPage();
          },
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // onde a Rown começa
        children: [
          Row(
            children: [
              // Padding(
              //   padding: EdgeInsets.only(right: 8),
              //   child: Icon(
              //     Icons.coffee,
              //     size: 48,
              //   ),
              // ),
              Container(
                // melhor para decorar e tratar imagem
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(image: AssetImage(imagePath))),
              ),
              Text(
                title,
                style: GoogleFonts.sacramento(fontSize: 30),
              ),
            ],
          ),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
