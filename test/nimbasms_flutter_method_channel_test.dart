import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nimbasms_flutter/nimbasms_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelNimbasmsFlutter platform = MethodChannelNimbasmsFlutter();
  const MethodChannel channel = MethodChannel('nimbasms_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
