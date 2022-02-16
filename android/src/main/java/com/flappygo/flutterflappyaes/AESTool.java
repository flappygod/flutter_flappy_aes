package com.flappygo.flutterflappyaes;

import android.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**********************************
 * Created by flappy go on 2016/8/23.
 * <p>
 * version  1.0.0
 */
public class AESTool {

    //Encrypt CBC
    public static String EncryptCBC(String sSrc, String sKey, String iv) throws Exception {
        if (sKey == null) {
            throw new RuntimeException("Key is null");
        }
        //set iv
        IvParameterSpec zeroIv = new IvParameterSpec(iv.getBytes());
        //keybyte
        byte[] raw = sKey.getBytes("utf-8");
        //aes
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        //AES/CBC/PKCS5Padding
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        //Encrypt
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, zeroIv);
        //Encrypt
        byte[] encrypted = cipher.doFinal(sSrc.getBytes("utf-8"));
        //base64
        return Base64.encodeToString(encrypted, Base64.DEFAULT);
    }

    //Decrypt CBC
    public static String DecryptCBC(String sSrc, String sKey, String iv) throws Exception {
        if (sKey == null) {
            throw new RuntimeException("Key is null");
        }
        //set iv
        IvParameterSpec zeroIv = new IvParameterSpec(iv.getBytes());
        //bytes
        byte[] raw = sKey.getBytes("utf-8");
        //aes
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        //"AES/CBC/PKCS5Padding"
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        //set
        cipher.init(Cipher.DECRYPT_MODE, skeySpec, zeroIv);
        //base 64
        byte[] encrypted1 = Base64.decode(sSrc, Base64.DEFAULT);
        //original
        byte[] original = cipher.doFinal(encrypted1);
        //set string
        String originalString = new String(original, "utf-8");
        //return str
        return originalString;
    }

    //Encrypt ECB
    public static String EncryptECB(String sSrc, String sKey) throws Exception {
        if (sKey == null) {
            throw new RuntimeException("Key is null");
        }
        //keybyte
        byte[] raw = sKey.getBytes("utf-8");
        //AES
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        //"AES/ECB/PKCS5Padding"
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        //Encrypt
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        //Encrypt
        byte[] encrypted = cipher.doFinal(sSrc.getBytes("utf-8"));
        //base64
        return Base64.encodeToString(encrypted, Base64.DEFAULT);
    }

    //Decrypt ECB
    public static String DecryptECB(String sSrc, String sKey) throws Exception {
        if (sKey == null) {
            throw new RuntimeException("Key is null");
        }
        //bytes
        byte[] raw = sKey.getBytes("utf-8");
        //AES
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        //AES/ECB/PKCS5Padding
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        //Decrypt
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        //base64
        byte[] encrypted1 = Base64.decode(sSrc, Base64.DEFAULT);
        //Decrypt
        byte[] original = cipher.doFinal(encrypted1);
        //ret string
        String originalString = new String(original, "utf-8");
        //return
        return originalString;
    }
}
