import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'nimbasms_flutter_platform_interface.dart';

/// An implementation of [NimbasmsFlutterPlatform] that uses method channels.
class MethodChannelNimbasmsFlutter extends NimbasmsFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('nimbasms_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
