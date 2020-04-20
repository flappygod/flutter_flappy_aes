//
//  AES128CBC_No_Padding_Unit.h
//
//
//  Created by apple on 14-5-13.
//  Copyright (c) 2014年 akforsure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Aes128: NSObject


+(NSString *)AesCBC128Encrypt:(NSString *)text
                   withKey:(NSString *)key
                    withIv:(NSString *)iv;



+(NSString *)AesCBC128Decrypt:(NSString *)text
                   withKey:(NSString *)key
                    withIv:(NSString *)iv;


/**
 *  AES128加密
 *
 *  @param text 原文
 *  @param key 秘钥
 *  @return 加密好的字符串
 */
+(NSString *)AES128Encrypt:(NSString *)text
                   withKey:(NSString *)key;

/**
 *  AES128解密
 *
 *  @param text  密文
 *  @param key  秘钥
 *  @return 明文
 */
+(NSString *)AES128Decrypt:(NSString *)text
                   withKey:(NSString *)key;



@end
