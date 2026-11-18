import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final Map<String, bool> _options = {
      "Banane" : false,
      "Fraise" : false,
      "Pêche" : false,
  };

  String? _groupValue;

  final Map<int, Widget> _segments = {
    0: const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("Uno"),),
    1: const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("Dos"),),
    3: const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("Tres"),)
  };
  int _currentSegment = 0;

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

  void _onValueChanged(String? string){
    setState(() {
      _groupValue = string;
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
                const SizedBox(height: 24,),
                const Text("Les Checkbox"),
                Card(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: _options.keys.map((key) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(key),
                              const SizedBox(width: 32,),
                              CupertinoCheckbox(value: _options[key], onChanged: (newValue){
                                setState(() {
                                  _options[key] = newValue ?? false;
                                });
                              }),
                            ],
                          );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24,),
                const Text("Radio: Mon animal préféré"),
                Column(
                  children: [
                    RadioGroup<String>(
                      groupValue: _groupValue,
                      onChanged: _onValueChanged,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          radio("Chat"),
                          radio("Chien"),
                          radio("Canard"),
                        ],
                      ),
                    )],
                ),
                Divider(),
                CupertinoSegmentedControl<int>(
                    children: _segments,
                    groupValue: _currentSegment,
                    onValueChanged: (s){
                      setState(() {
                        _currentSegment = s;
                      });
                    },
                  selectedColor: CupertinoColors.systemPurple,
                  borderColor: CupertinoColors.darkBackgroundGray,
                  unselectedColor: CupertinoColors.systemMint,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget radio(String value){
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey3,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 250,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value),
          CupertinoRadio<String>(value: value),
        ],
      ),
    );
  }

}