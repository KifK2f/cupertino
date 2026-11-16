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
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}