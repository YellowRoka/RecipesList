import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'theme.dart';

class NetErrorTextView extends StatelessWidget {
  
  const NetErrorTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Center(child: Text(localizations.textNetError, style: textStyleBase ));
  }
}
