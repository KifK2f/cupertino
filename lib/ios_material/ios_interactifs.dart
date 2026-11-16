import 'package:flutter/cupertino.dart';

class IosInteractif extends StatefulWidget {
  const IosInteractif({super.key});


  @override
  State<StatefulWidget> createState() {
    return _InteractifState();
  }

}

class _InteractifState extends State<IosInteractif> {

  //Values
  double _sliderValue = 35;
  bool isOn = false;
  late TextEditingController _controller;
  String _name = "";

  //méthods for updates
  void _updateSlider(double newValue){
    setState(() {
      _sliderValue = newValue;
    });
  }

  void _updateSwitch(bool newValue){
    setState(() {
      isOn = newValue;
    });
  }

  void _updateName(){
    setState(() {
      _name = _controller.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //build
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text("Les interactifs"),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(_sliderValue.toStringAsFixed(2)),
                   Expanded(
                     child:  CupertinoSlider(value: _sliderValue,
                       min: 0,
                       max: 100,
                       onChanged: _updateSlider),
                   )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(isOn ? "Switch ON" : "Switch OFF", style: TextStyle(color: isOn ? CupertinoColors.systemGreen : CupertinoColors.systemRed),),
                    CupertinoSwitch(value: isOn, onChanged: _updateSwitch)
                  ],
                ),
                CupertinoTextField(
                    controller:  _controller,
                  placeholder: "Entrer votre nom",
                  // keyboardType: TextInputType.number,
                  suffix: CupertinoButton(child: const Icon(CupertinoIcons.paperplane),
                      onPressed: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                    _updateName();
                      }),
                  onSubmitted: ((_) => _updateName()), //POur valider avec l'appui sur le bouton du clavier aussi
                ),
                Text("Bienvenue : $_name"),
              ],
            ),
          )
        ],
      ),
    );
  }

}