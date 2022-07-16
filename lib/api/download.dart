import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = 'https://edutiv-capstone.herokuapp.com';

Future open(int enrolledCourseId, String fileName) async {
  final downloadedFile = await startDownload(enrolledCourseId, fileName);
  OpenFile.open(downloadedFile!.path);
}

Future<File>? startDownload(int enrolledCourseId, String fileName) async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  double progress = 0.0;
  String path = await _getFilePath(fileName);
  final file = File(path);

  await Dio().download(
    baseUrl + '/enrolled/download-report/$enrolledCourseId',
    path,
    onReceiveProgress: (receivedBytes, totalBytes) {
      progress = receivedBytes / totalBytes;
      print(progress);
    },
    options: Options(
      headers: {'Authorization': 'Bearer $token'},
    ),
  );
  return file;
}

Future<String> _getFilePath(String fileName) async {
  final dir = await getApplicationDocumentsDirectory();
  return '${dir.path}/$fileName';
}
