import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosPageScaffold extends StatelessWidget {
  const IosPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle:  Text("iOS Baby"),
        leading:  Icon(Icons.person),
        trailing:  Icon(Icons.settings),
        automaticBackgroundVisibility: false, //Pour afficher la couleur de l'aPPBar
      ),
        child: Center()
    );
  }
}