import 'package:flutter/material.dart';

import 'theme.dart';

class UniversalButton extends StatelessWidget {
  final double?      size;
  final IconData     icon;
  final VoidCallback callBack;

  const UniversalButton({Key? key, required this.size, required this.icon, required this.callBack}) : super(key: key);
  
  @override
  Widget build( BuildContext context ){
    final ButtonStyle styleFrom =  ElevatedButton.styleFrom(
      shape:   const CircleBorder(),
      padding: const EdgeInsets.all(1),
      primary: colorTheme3
    );

    return SizedBox(
      width:  size,
      height: size,
      child: ElevatedButton(
        onPressed: callBack,
        style:     styleFrom,
        child:     Center( child: Icon( icon, color: colorTheme1 ) ),
      ),
    );
  }
}
