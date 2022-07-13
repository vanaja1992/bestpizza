import 'package:flutter/services.dart';

class FileHelper{
  static Future<String> readFile(String path) async {

   String fileData = await rootBundle.loadString(path);
   return fileData;
  }
}