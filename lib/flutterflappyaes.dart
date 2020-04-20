import 'dart:async';

import 'package:flutter/services.dart';

//皆为  pkcs5padding/pkcs7padding  填充方式
//位数  128
//如需新增，请修改源码

class Flutterflappyaes {
  //aes
  static const MethodChannel _channel = const MethodChannel('flutterflappyaes');

  //进行aes加密
  static Future<String> aesEncrypt(
      String data, String aeskey, String iv) async {
    final String aes = await _channel
        .invokeMethod('aesEncrypt', {"data": data, "aeskey": aeskey, "iv": iv});
    return aes;
  }

  //进行aesecb加密
  static Future<String> aesEncryptECB(String data, String aeskey) async {
    final String aes = await _channel
        .invokeMethod('aesEncryptECB', {"data": data, "aeskey": aeskey});
    return aes;
  }

  //进行aes解密
  static Future<String> aesDecrypt(
      String data, String aeskey, String iv) async {
    final String aes = await _channel
        .invokeMethod('aesDecrypt', {"data": data, "aeskey": aeskey, "iv": iv});
    return aes;
  }

  //进行aesecb解密
  static Future<String> aesDecryptECB(String data, String aeskey) async {
    final String aes = await _channel.invokeMethod('aesDecryptECB', {
      "data": data,
      "aeskey": aeskey,
    });
    return aes;
  }
}
