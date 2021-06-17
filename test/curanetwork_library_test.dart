import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:curanetwork_library/curanetwork_library.dart';

void main() {
  const MethodChannel channel = MethodChannel('curanetwork_library');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await CuranetworkLibrary.platformVersion, '42');
  });
}
