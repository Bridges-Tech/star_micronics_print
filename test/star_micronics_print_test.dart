import 'package:flutter_test/flutter_test.dart';
import 'package:star_micronics_print/star_micronics_print.dart';
import 'package:star_micronics_print/star_micronics_print_platform_interface.dart';
import 'package:star_micronics_print/star_micronics_print_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockStarMicronicsPrintPlatform
    with MockPlatformInterfaceMixin
    implements StarMicronicsPrintPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final StarMicronicsPrintPlatform initialPlatform = StarMicronicsPrintPlatform.instance;

  test('$MethodChannelStarMicronicsPrint is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelStarMicronicsPrint>());
  });

  test('getPlatformVersion', () async {
    StarMicronicsPrint starMicronicsPrintPlugin = StarMicronicsPrint();
    MockStarMicronicsPrintPlatform fakePlatform = MockStarMicronicsPrintPlatform();
    StarMicronicsPrintPlatform.instance = fakePlatform;

    expect(await starMicronicsPrintPlugin.getPlatformVersion(), '42');
  });
}