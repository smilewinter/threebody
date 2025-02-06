import 'package:threebody/main.dart';

class AppLogic {
  Future<void> bootstrap() async {
    await localeLogic.load();
  }
}
