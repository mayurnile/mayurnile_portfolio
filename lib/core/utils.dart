import 'package:url_launcher/url_launcher.dart';

class Utils {
  // const Constructor
  const Utils();

  /// Launch any URL passed into the method
  static Future<void> openURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
