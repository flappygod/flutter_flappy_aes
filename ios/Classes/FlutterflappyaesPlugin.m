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
    //aesEncryptCBC
    if([@"aesEncryptCBC" isEqualToString:call.method]){
        NSString* data=(NSString*)call.arguments[@"data"];
        NSString* aeskey=(NSString*)call.arguments[@"aeskey"];
        NSString* iv=(NSString*)call.arguments[@"iv"];
        NSString* ret= [Aes128 AesCBC128Encrypt:data
                                        withKey:aeskey
                                         withIv:iv];
        
        result(ret);
        
    }
    //aesEncryptECB
    else if([@"aesEncryptECB" isEqualToString:call.method]){
        NSString* data=(NSString*)call.arguments[@"data"];
        NSString* aeskey=(NSString*)call.arguments[@"aeskey"];
        NSString* ret= [Aes128 AES128Encrypt:data
                                     withKey:aeskey];
        
        result(ret);
        
    }
    //aesDecryptCBC
    else if([@"aesDecryptCBC" isEqualToString:call.method]){
        NSString* data=(NSString*)call.arguments[@"data"];
        NSString* aeskey=(NSString*)call.arguments[@"aeskey"];
        NSString* iv=(NSString*)call.arguments[@"iv"];
        NSString* ret= [Aes128 AesCBC128Decrypt:data
                                        withKey:aeskey
                                         withIv:iv];
        
        result(ret);
        
    }
    //aesDecryptECB
    else if([@"aesDecryptECB" isEqualToString:call.method]){
        NSString* data=(NSString*)call.arguments[@"data"];
        NSString* aeskey=(NSString*)call.arguments[@"aeskey"];
        NSString* ret= [Aes128 AES128Decrypt:data
                                     withKey:aeskey];
        result(ret);
        
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
