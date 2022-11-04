import 'package:injectable/injectable.dart';

//const notWeb = Environment('notWeb');

abstract class AppEnvironment{
  String get userBaseUrl;
}

@Singleton(as: AppEnvironment)
class ProdEnvironment extends AppEnvironment{

  @override
  String get userBaseUrl => 'https://familyfinancestest-f8319-default-rtdb.firebaseio.com/';
}
