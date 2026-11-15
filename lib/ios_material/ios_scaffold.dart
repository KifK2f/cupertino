import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosPageScaffold extends StatefulWidget {
  const IosPageScaffold({super.key});

  @override
  State<StatefulWidget> createState() {
    return _IOSPageScaffoldState();
  }

}

class _IOSPageScaffoldState extends State<IosPageScaffold> {
  Color color = CupertinoColors.systemTeal;

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
        child: SizedBox(
          // color: CupertinoColors.activeGreen,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                // pressedOpacity: 0.8,
                // color: CupertinoColors.systemTeal,
                  child: const Text("Cupertino button simple"),
                  onPressed: () {
          
                  }
              ),
              CupertinoButton.filled(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.color_filter),
                        Text("Changer la couleur")
                      ],
              ), onPressed: (){
                    setState(() {
                      color = color == CupertinoColors.systemTeal
                          ? CupertinoColors.systemPurple
                          : CupertinoColors.systemTeal;
                    });
              }),
              CircleAvatar(
                radius: 32,
                backgroundColor: color,
              )
            ],
          )),
        ),
      ),
    );
  }
}