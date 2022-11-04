import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

//create screenshot on emulator

Future<void> main(){
	return integrationDriver(onScreenshot: (name, bytes) async {
			final File image = await File("screenshots/$name.png").create( recursive: true );
			
			image.writeAsBytesSync( bytes );
			return true;
		});
}
