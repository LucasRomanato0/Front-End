import 'package:exemplo1/breakpoints.dart';
import 'package:exemplo1/pages/home/widgets/app_bar/mobile_app_bar.dart';
import 'package:exemplo1/pages/home/widgets/app_bar/web_app_bar.dart';
import 'package:exemplo1/pages/home/widgets/sections/top_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: constraints.maxWidth < mobileBreakPoint
              ? const PreferredSize(
                  preferredSize: Size(double.infinity, 56),
                  child: MobileAppBar(),
                )
              : const PreferredSize(
                  preferredSize: Size(double.infinity, 72),
                  child: WebAppBar(),
                ),
          drawer:
              constraints.maxWidth < mobileBreakPoint ? const Drawer() : null,
          body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1400, // caso a tela seja muito grande ele limita
              ),
              child: ListView(
                children: [
                  TopSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
