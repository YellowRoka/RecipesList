import 'package:flutter/material.dart';

import 'theme.dart';

class CircleLoadingBar extends StatelessWidget {
  const CircleLoadingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 300,
        width:  300,
        child:  CircularProgressIndicator( color: colorTheme1 ),
      ),
    );
  }
}
