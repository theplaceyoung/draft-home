import 'package:url_launcher/url_launcher.dart';

void launchInstagram() async {
  const url = 'https://www.instagram.com/exoticordinary_official/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
