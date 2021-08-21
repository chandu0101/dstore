import 'package:dstore/dstore.dart';
part 'simple_history_ps.ps.dstore.dart';

@PState(enableHistory: true)
class $_SimpleHistory {
  int count = 0;

  void increment() {
    this.count += 1;
  }

  void decrement() {
    this.count -= 1;
  }
}
