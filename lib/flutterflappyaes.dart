import 'dart:async';

import 'package:flutter/services.dart';

//pkcs5padding/pkcs7padding
//128


class Flutterflappyaes {
  //aes
  static const MethodChannel _channel = const MethodChannel('flutterflappyaes');

  //encrypt cbc
  static Future<String?> aesEncryptCBC(
      String data, String aeskey, String iv) async {
    final String? aes = await _channel
        .invokeMethod('aesEncryptCBC', {"data": data, "aeskey": aeskey, "iv": iv});
    return aes;
  }

  //ecb
  static Future<String?> aesEncryptECB(String data, String aeskey) async {
    final String? aes = await _channel
        .invokeMethod('aesEncryptECB', {"data": data, "aeskey": aeskey});
    return aes;
  }

  //decrypt cbc
  static Future<String?> aesDecryptCBC(
      String data, String aeskey, String iv) async {
    final String? aes = await _channel
        .invokeMethod('aesDecryptCBC', {"data": data, "aeskey": aeskey, "iv": iv});
    return aes;
  }

  //decrypt ecb
  static Future<String?> aesDecryptECB(String data, String aeskey) async {
    final String? aes = await _channel.invokeMethod('aesDecryptECB', {
      "data": data,
      "aeskey": aeskey,
    });
    return aes;
  }
}
