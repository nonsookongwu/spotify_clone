
import 'package:spotify_app/core/configs/constants/app_urls.dart';

class UtilityFunctions {

  static String capitalizeWords(String text) {
    return text
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;

          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  static String getCoverImageLink(String text) {
    final name = text.split(" ").join("%20");
    final coverLink =
        "${AppUrls.firebasestorageBasePath}$name.jpg${AppUrls.firebasestorageEndPath}";

    return coverLink;
  }
}