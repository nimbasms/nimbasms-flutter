import 'package:flutter_test/flutter_test.dart';
import 'package:nimbasms_flutter/nimbasms_flutter.dart';
import 'package:nimbasms_flutter/nimbasms_flutter_platform_interface.dart';
import 'package:nimbasms_flutter/nimbasms_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNimbasmsFlutterPlatform
    with MockPlatformInterfaceMixin
    implements NimbasmsFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NimbasmsFlutterPlatform initialPlatform = NimbasmsFlutterPlatform.instance;

  test('$MethodChannelNimbasmsFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNimbasmsFlutter>());
  });

  test('getPlatformVersion', () async {
    // NimbasmsFlutter nimbasmsFlutterPlugin = NimbasmsFlutter();
    // MockNimbasmsFlutterPlatform fakePlatform = MockNimbasmsFlutterPlatform();
    // NimbasmsFlutterPlatform.instance = fakePlatform;

    // expect(await nimbasmsFlutterPlugin.getPlatformVersion(), '42');
  });
}
