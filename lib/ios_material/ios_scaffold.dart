import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosPageScaffold extends StatelessWidget {
  const IosPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle:  Text("Application iOS"),
      ),
      // navigationBar: CupertinoNavigationBar(
      //   middle:  Text("iOS Baby"),
      //   leading:  Icon(Icons.person),
      //   trailing:  Icon(Icons.settings),
      //   automaticBackgroundVisibility: false, //Pour afficher la couleur de l'aPPBar
      // ),
      //   child: CustomScrollView(
      //     scrollDirection: Axis.vertical,
      //     slivers: [
      //       CupertinoSliverNavigationBar(
      //         largeTitle: Text("Application iOS"),
      //         leading: Icon(Icons.add),
      //       ),
      //       SliverFillRemaining(
      //         child: Text("Salut les codeurs"),
      //       )
      //     ],
      //   )
      child: SafeArea(
        bottom: false, //Prndre l'intégralité du botom de l'écran
        child: Container(color: Colors.red,), ),
    );
  }
}