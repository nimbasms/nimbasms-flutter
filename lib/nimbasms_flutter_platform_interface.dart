import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'nimbasms_flutter_method_channel.dart';

abstract class NimbasmsFlutterPlatform extends PlatformInterface {
  /// Constructs a NimbasmsFlutterPlatform.
  NimbasmsFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static NimbasmsFlutterPlatform _instance = MethodChannelNimbasmsFlutter();

  /// The default instance of [NimbasmsFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelNimbasmsFlutter].
  static NimbasmsFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NimbasmsFlutterPlatform] when
  /// they register themselves.
  static set instance(NimbasmsFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
