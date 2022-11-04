import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'theme.dart';

class NetErrorTextView extends StatelessWidget {
  final AppLocalizations localizations;
  
  const NetErrorTextView({Key? key, required this.localizations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(localizations.textNetError, style: textStyleBase ));
  }
}