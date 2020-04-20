#import "FlutterflappyaesPlugin.h"
#import "Aes128.h"

@implementation FlutterflappyaesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutterflappyaes"
                                     binaryMessenger:[registrar messenger]];
    FlutterflappyaesPlugin* instance = [[FlutterflappyaesPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    //AES加密
    if([@"aesEncryptCBC" isEqualToString:call.method]){
        //获取加密字符串
        NSString* data=(NSString*)call.arguments[@"data"];
        //获取秘钥
        NSString* aeskey=(NSString*)call.arguments[@"aeskey"];
        //偏移量
        NSString* iv=(NSString*)call.arguments[@"iv"];
        //进行CBC加密
        NSString* ret= [Aes128 AesCBC128Encrypt:data
                                        withKey:aeskey
                                         withIv:iv];
        
        result(ret);
        
    }
    //AESECB加密
    else if([@"aesEncryptECB" isEqualToString:call.method]){
        //获取加密字符串
        NSString* data=(NSString*)call.arguments[@"data"];
        //获取秘钥
        NSString* aeskey=(NSString*)call.arguments[@"aeskey"];
        //进行CBC加密
        NSString* ret= [Aes128 AES128Encrypt:data
                                     withKey:aeskey];
        
        result(ret);
        
    }
    //AES解密
    else if([@"aesDecryptCBC" isEqualToString:call.method]){
        //获取加密字符串
        NSString* data=(NSString*)call.arguments[@"data"];
        //获取秘钥
        NSString* aeskey=(NSString*)call.arguments[@"aeskey"];
        //偏移量
        NSString* iv=(NSString*)call.arguments[@"iv"];
        //进行CBC解密
        NSString* ret= [Aes128 AesCBC128Decrypt:data
                                        withKey:aeskey
                                         withIv:iv];
        
        result(ret);
        
    }
    //AESECB解密
    else if([@"aesDecryptECB" isEqualToString:call.method]){
        //获取加密字符串
        NSString* data=(NSString*)call.arguments[@"data"];
        //获取秘钥
        NSString* aeskey=(NSString*)call.arguments[@"aeskey"];
        //进行CBC解密
        NSString* ret= [Aes128 AES128Decrypt:data
                                     withKey:aeskey];
        
        result(ret);
        
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
