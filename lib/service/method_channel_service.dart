import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MethodChannelService extends GetxService {
  
   final platform = MethodChannel('com.example.app/example');


navigateToAndroidRoute({required String payLoad}) async {
    try {
      await platform.invokeMethod('sendData', {
        "data": payLoad,
      });
    } catch (e) {
      log(e.toString());
    }
  }
}