import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceUtils {
  static Future<void> shareOnWhatsApp() async {
    String phone = "918870529527";
    String message = "Hey! Quruz";
    String url = "https://wa.me/$phone?text=${Uri.encodeComponent(message)}";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch WhatsApp");
    }
  }

  static void shareOnLinkedIn(String content, {String? url}) async {
    final linkedInUrl =
        'https://www.linkedin.com/sharing/share-offsite/?url=${Uri.encodeComponent(url ?? 'https://yourwebsite.com')}&summary=${Uri.encodeComponent(content)}';

    if (await canLaunch(linkedInUrl)) {
      await launch(linkedInUrl);
    } else {
      debugPrint('Could not launch LinkedIn');
    }
  }

  static void shareText() {
    Share.share('Hi Qoruz!');
  }
}
