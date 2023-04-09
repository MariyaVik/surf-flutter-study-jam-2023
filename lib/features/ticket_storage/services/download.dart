import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Download {
  int total = 0;
  int received = 0;

  Future download(String url, String filename) async {
    var savePath = '/storage/emulated/0/Download/$filename';
    var dio = Dio();
    dio.interceptors.add(LogInterceptor());
    try {
      var response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(seconds: 2),
        ),
      );
      var file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void showDownloadProgress(rec, tot) {
    if (total != -1) {
      total = tot;
      received = rec;
      debugPrint((rec / tot * 100).toStringAsFixed(0) + '%');
      debugPrint('Загружается $rec из $tot');
    }
  }
}
