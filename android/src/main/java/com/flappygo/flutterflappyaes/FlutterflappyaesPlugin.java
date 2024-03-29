package com.flappygo.flutterflappyaes;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterflappyaesPlugin
 */
public class FlutterflappyaesPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutterflappyaes");
        channel.setMethodCallHandler(this);
    }

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    public static void registerWith(Registrar registrar) {
        MethodChannel channel = new MethodChannel(registrar.messenger(), "flutterflappyaes");
        FlutterflappyaesPlugin instance = new FlutterflappyaesPlugin();
        instance.channel = channel;
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        //aes
        if (call.method.equals("aesEncryptCBC")) {
            try {
                String data = call.argument("data");
                String aeskey = call.argument("aeskey");
                String iv = call.argument("iv");
                String str = AESTool.EncryptCBC(data, aeskey, iv);
                result.success(str);
            } catch (Exception e) {
                result.error("error", e.getMessage(), e.getLocalizedMessage());
            }
        }
        //ecb
        else if (call.method.equals("aesEncryptECB")) {
            try {
                String data = call.argument("data");
                String aeskey = call.argument("aeskey");
                String str = AESTool.EncryptECB(data, aeskey);
                result.success(str);
            } catch (Exception e) {
                result.error("error", e.getMessage(), e.getLocalizedMessage());
            }
        }
        //aes
        else if (call.method.equals("aesDecryptCBC")) {
            try {
                String data = call.argument("data");
                String aeskey = call.argument("aeskey");
                String iv = call.argument("iv");
                String str = AESTool.DecryptCBC(data, aeskey, iv);
                result.success(str);
            } catch (Exception e) {
                result.error("error", e.getMessage(), e.getLocalizedMessage());
            }
        }
        //ecb
        else if (call.method.equals("aesDecryptECB")) {
            try {
                String data = call.argument("data");
                String aeskey = call.argument("aeskey");
                String str = AESTool.DecryptECB(data, aeskey);
                result.success(str);
            } catch (Exception e) {
                result.error("error", e.getMessage(), e.getLocalizedMessage());
            }
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
