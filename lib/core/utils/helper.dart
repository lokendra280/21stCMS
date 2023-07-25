import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  /// get date difference in Duration [from current date to toDate ]
  static Duration getDateDifference(String toDate, {DateTime? fromDate}) {
    final date = DateTime.parse(toDate); //parse passed string to datetime
    final fromDet = fromDate ??
        DateTime
            .now(); //if from date passed null duration will be calculated from current time
    return date.difference(fromDet); //return difference
  }

  static Future<XFile?> getImage({ImageSource? imageSource}) async {
    try {
      final _picker = ImagePicker();
      // Pick an image
      final imageFile =
          await _picker.pickImage(source: imageSource ?? ImageSource.gallery);
      if (imageFile == null) {
        return null;
      } else {
        return imageFile;
      }
      // var tmpFile = File(imageFile.path);
      // final appDir = await getApplicationDocumentsDirectory();
      // final fileName = basename(imageFile.path);
      // tmpFile = await tmpFile.copy('${appDir.path}/$fileName');
    } catch (e) {
      return null;
    }
  }

  /// convert a Map into a URL encoded string
  static String encodeMap(Map data) {
    return data.keys
        .map((key) =>
            "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}")
        .join("&");
  }

  /// Get first few words of a String
  static String getFirstWords(String sentence, int wordCounts) {
    return sentence.split(" ").sublist(0, wordCounts).join(" ");
  }

  ///check whether the to date is valid --> means it should not be less then current time
  static bool checkIfDateIsValid(String validDate) {
    final vDate = DateTime.parse(validDate);
    var date = DateTime.now();
    var valDate = date.isBefore(vDate);
    return valDate;
  }

  /// formats date in something like 2013-04-20
  static String formatDateOnly({required String dateString, String? pattern}) {
    final now = DateTime.parse(dateString);
    final formatter = DateFormat(pattern ?? 'dd MMMM y'); //yyyy-MM-dd
    final formatted = formatter.format(now);
    return formatted; // something like 2013-04-20
  }

  static String formatTimeOnly({required String dateString, String? pattern}) {
    final now = DateTime.parse(dateString);
    final formatter = DateFormat(pattern ?? 'HH:mm\na'); //yyyy-MM-dd
    final formatted = formatter.format(now);
    return formatted; // something like 2013-04-20
  }

  /// formats date in something like 2013-04-20
  static String formatDateByDate({required DateTime dateTime, String? locale}) {
    final formatter = DateFormat.yMMMMd(locale ?? "en_US");
    final formatted = formatter.format(dateTime);
    return formatted; // something like 2013-04-20
  }

  /// formats date in something like 1/10/2012
  static String fonePayDateFormat(
      {required DateTime dateTime, String? locale}) {
    final formatter = DateFormat.yMd(locale ?? "en_US");
    final formatted = formatter.format(dateTime);
    return formatted; // something like 2013-04-20
  }

  /// formats date in something like 2013-04-20 12 : 12: 00
  static String formatTime({required String dateString}) {
    final now = DateTime.parse(dateString);
    final formatter = DateFormat('dd MMMM y, HH:mm a'); //yMMMEd
    final formatted = formatter.format(now);
    return formatted; // something like 2013-04-20 12 : 12: 00
  }

  /// get random number from range
  static int getRandomNumber({int? max}) {
    final random = Random();
    final randomNumber = random.nextInt(max ?? 10); // from 0 upto 99 included
    return randomNumber;
  }

  /// get random number from range
  /// You can get your iOS app id from
  /// http://itunes.apple.com/lookup?bundleId=YOUR_BUNDLE_ID then look for trackId
  ///
  // static void launchAppStore() {
  //   if (Platform.isAndroid || Platform.isIOS) {
  //     final appId =
  //         Platform.isAndroid ? 'com.user.salesberry' : '1603774088'; //replace with salesberry app id
  //     final url = Uri.parse(
  //       Platform.isAndroid
  //           ? "market://details?id=$appId"
  //           : "https://apps.apple.com/app/id$appId",
  //     );
  //     launchUrl(
  //       url,
  //       mode: LaunchMode.externalApplication,
  //     );
  //   }
  // }

  /// returns date difference in seconds
  static int daysBetween(String from, String to) {
    try {
      var date1 = DateTime.parse(from);
      var date2 = DateTime.parse(to);
      var d1 = DateTime(date1.year, date1.month, date1.day);
      var d2 = DateTime(date2.year, date2.month, date2.day);
      return (d2.difference(d1).inHours / 24)
          .round(); // divide by 24 for hours to get in day // divide by 86400 for seconds to get in day  //  divide by 1440 for minutes to get in day
    } catch (e) {
      return 0;
    }
  }

  /// generate random string based on passed length //default = 6
  static String generateRandomString({int? len}) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len ?? 6, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  /// capitalize the first letter
  static String capitalizeFirstWord(String text) {
    return (text.toLowerCase()).capitalizeFirstofEach;
  }
}

// extension StringExtension on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${this.substring(1)}";
//   }
// }

/// capitalize each word of a sentence
extension CapExtension on String {
  String get inCaps =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get allInCaps => toUpperCase();

  String get capitalizeFirstofEach => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");

  String smallSentence() {
    if (length > 30) {
      return '${substring(0, 30)}...';
    } else {
      return this;
    }
  }

// String firstFewWords() {
//   int startIndex = 0, indexOfSpace;
//
//   for (var i = 0; i < 6; i++) {
//     var indexOfSpace = indexOf(' ', startIndex);
//     if (indexOfSpace == -1) {
//       //-1 is when character is not found
//       return this;
//     }
//     startIndex = indexOfSpace + 1;
//   }
//
//   return '${substring(0, indexOfSpace)}...';
// }
}
