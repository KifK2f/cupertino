import 'package:cupertino/ios_material/ios_detail_list.dart';
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

  final Map<String, String> _animals = {
    "Chat" : "😻",
    "Chien" : "🐶",
    "Lion" : "🦁",
    "Licorne" : "🦄"
  };

  String _chosenAnimalKey = "Chat";

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

  void _sheet(){
    showCupertinoModalPopup(context: context,
        builder: (BuildContext context){
          return CupertinoActionSheet(
              title: const Text("Quel est votre animal préféré?"),
              message: const Text("Choississez votre animal"),
            actions: _animals.keys.map((key) {
              return CupertinoActionSheetAction(onPressed: (){
                setState(() {
                  Navigator.pop(context);
                  _chosenAnimalKey = key;
                });
              },
                  child: Row(
                    children: [
                      Text(key),
                      Text(_animals[key]!),
                    ],
                  )
              );
            }).toList(),
            cancelButton: CupertinoActionSheetAction(
                child: const Text("Annuler"),
                onPressed: (){
                  Navigator.pop(context);
                },
            ),
          );
        }
    );
  }

  void _surface(){
    showCupertinoModalPopup(context: context,
        builder: (BuildContext context){
        return CupertinoPopupSurface(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12
              ),
              child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
              const Text("Vous avez été déconnecté"),
              CupertinoButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: const Icon(CupertinoIcons.arrow_down_right_arrow_up_left),
              )
                        ],
                      ),
            )
        )
        ;
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
                CupertinoButton(onPressed: _alert, child: const Text("Alerte simple")),
                Text("Mon animal : $_chosenAnimalKey ${_animals[_chosenAnimalKey]}"),
                CupertinoButton(onPressed: _sheet, child: const Text("Action Sheet")),
                CupertinoButton(onPressed: _surface, child: const Text("Pop up")),
                CupertinoButton(onPressed: (){
                  final route = CupertinoPageRoute(
                    fullscreenDialog: true,
                      builder: (context){
                    return IosDetailList(data: "On est passé");
                  });
                    Navigator.push(context, route);
                }, child: const Text("Full Screen")),
              ],
            ),
          ),
        )
      ],
    ));
  }
}