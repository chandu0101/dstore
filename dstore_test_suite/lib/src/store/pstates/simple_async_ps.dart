import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/tests.dart';
part 'simple_async_ps.ps.dstore.dart';

@PState()
class $_SimpleAsync {
  int x = 0;

  void delayedSet() async {
    await this.delay(500);
    this.x = 5;
  }

  void shouldCatchErrors() async {
    await this.delay(600);
    throw asyncException;
    this.x = 6;
  }

  @RegularMethod()
  Future<dynamic> delay(int milliseconds) async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    print("after delay");
  }
}
