import 'package:flutter/services.dart';

/// The Android side of in-app updates (see MainActivity.kt). An interface so
/// tests can stand in for the phone.
abstract class UpdatePlatform {
  Future<int> sdkInt();

  /// Private cache folder for the downloaded APK.
  Future<String> cacheDir();

  /// True on mobile data or another connection the user may pay for.
  Future<bool> isMetered();

  /// Whether the user has allowed "Install unknown apps" for Open Study.
  Future<bool> canInstall();

  /// Opens Android's "Install unknown apps" setting for Open Study.
  Future<void> openInstallSettings();

  /// Hands the APK to Android's installer. With [silent] on Android 12+ no
  /// prompt is shown; otherwise Android asks the user to confirm.
  Future<void> install(String path, {required bool silent});

  /// What happened to the last install attempt, once: null,
  /// 'needs_confirmation' or 'failed: <message>'.
  Future<String?> takeInstallOutcome();
}

class MethodChannelUpdatePlatform implements UpdatePlatform {
  static const _channel = MethodChannel('open_study/updater');

  @override
  Future<int> sdkInt() async => await _channel.invokeMethod<int>('sdkInt') ?? 0;

  @override
  Future<String> cacheDir() async => (await _channel.invokeMethod<String>('cacheDir'))!;

  @override
  Future<bool> isMetered() async => await _channel.invokeMethod<bool>('isMetered') ?? true;

  @override
  Future<bool> canInstall() async => await _channel.invokeMethod<bool>('canInstall') ?? false;

  @override
  Future<void> openInstallSettings() => _channel.invokeMethod('openInstallSettings');

  @override
  Future<void> install(String path, {required bool silent}) =>
      _channel.invokeMethod('install', {'path': path, 'silent': silent});

  @override
  Future<String?> takeInstallOutcome() => _channel.invokeMethod<String>('takeInstallOutcome');
}
