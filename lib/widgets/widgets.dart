import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';

Widget bottomSocial({
  required String img,
  required String url,
  required bool isDarkMode,
}) {
  return GestureDetector(
    onTap: () async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        // Handle error case, e.g., show a SnackBar or dialog
        debugPrint('Could not launch URL');
      }
    },
    child: LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return Container(
          width: w / 5.7,
          height: h / 12,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                offset: const Offset(5, 5),
                color: isDarkMode
                    ? kLightShadowColor
                    : kDarkShadowColor,
              ),
              BoxShadow(
                blurRadius: 10.0,
                offset: const Offset(-5, -5),
                color: isDarkMode ? kLightSecondaryColor : kDarkSecondaryColor,
              ),
            ],
            color: isDarkMode ? kLightPrimaryColor : kDarkPrimaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(img),
                ),
              ),
              width: w / 8.5,
              height: h / 17.5,
            ),
          ),
        );
      },
    ),
  );
}