import 'package:flutter/cupertino.dart';

class IosAlertPage  extends StatefulWidget {
  const IosAlertPage({super.key});


  @override
  State<StatefulWidget> createState() {
    return _AlertState();
  }

}

class _AlertState extends State<IosAlertPage> {
  Color _backgroundColor = CupertinoColors.systemBlue;

  void _alert(){
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Couleur du Nav"),
            content: const Text("Choissisez la couleur"),
            actions: [
              CupertinoDialogAction(
                child: const Text("Bleu"),
                isDefaultAction: true,
                isDestructiveAction: false,
                onPressed: (){
                  Navigator.pop(context);
                  setState(() {
                    _backgroundColor = CupertinoColors.systemBlue;
                  });
                },
              ),

              CupertinoDialogAction(
                child: const Text("Mint"),
                isDefaultAction: false,
                isDestructiveAction: false,
                onPressed: (){
                  Navigator.pop(context);
                  setState(() {
                    _backgroundColor = CupertinoColors.systemMint;
                  });
                },
              ),


              CupertinoDialogAction(
                child: const Text("Annuler"),
                isDefaultAction: false,
                isDestructiveAction: true,
                onPressed: (){
                  Navigator.pop(context);
                },
              ),



            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: CustomScrollView(
      slivers: [
       CupertinoSliverNavigationBar(
          largeTitle: const Text("Les alertes"),
         backgroundColor: _backgroundColor,
         automaticBackgroundVisibility: false,
        ),
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(child: const Text("Alerte simple"), onPressed: _alert)
              ],
            ),
          ),
        )
      ],
    ));
  }
}