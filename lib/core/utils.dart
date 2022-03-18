import 'package:url_launcher/url_launcher.dart';

class Utils {
  // const Constructor
  const Utils();

  /// Launch any URL passed into the method
  static Future<void> openURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  /// Launch to send email
  static Future<void> sendEmail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'mayurnile95@gmail.com',
      query: encodeQueryParameters(<String, String>{'subject': 'Hey! Let\'s have a conversation'}),
    );

    launch(emailLaunchUri.toString());
  }
}
