library tekartik_test_config_io;

import 'package:unittest/vm_config.dart' as cfg;
import 'package:unittest/unittest.dart';
import 'test_config.dart';

export 'package:tekartik_utils/test_utils.dart';

final _configuration = new ConfigurationIo();

void useVMConfiguration() {
  unittestConfiguration = _configuration;
}

class ConfigurationIo extends cfg.VMConfiguration with DebugConfiguration {

  ConfigurationIo() {
    debugOnCreate(this);
  }

  @override
  void onTestStart(TestCase testCase) {
    debugOnTestStart(testCase);
    super.onTestStart(testCase);

  }

  @override
  void onTestResult(TestCase testCase) {
    debugOnTestResult(testCase);
    super.onTestResult(testCase);
  }

}
//import 'package:idb_shim/idb_client.dart';

//IdbFactory idbFactory;
