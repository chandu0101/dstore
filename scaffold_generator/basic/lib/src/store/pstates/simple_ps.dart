import 'package:dstore/dstore.dart';
part 'simple_ps.ps.dstore.dart';

@PState()
class $_SimplePS {
  int count = 0;

  void increment() {
    this.count += 1;
  }

  void decrement() {
    this.count -= 1;
  }
}
