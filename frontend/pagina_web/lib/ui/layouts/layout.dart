

import 'package:flutter/material.dart';

class Layout extends StatelessWidget {

  final Widget child;

  const Layout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildDecoration(),
        child: child,
      ),
    );
  }

  BoxDecoration buildDecoration() => const BoxDecoration(
    image: DecorationImage(image: AssetImage('lib/assets/images/fondo.jpg'), fit: BoxFit.cover)
  );
}