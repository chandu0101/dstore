import 'package:dstore/dstore.dart';
part 'simple_flutter_selectors.ps.dstore.dart';

@PState()
class $_SimpleFlutterSelectors {
  int count = 0;

  void increment() {
    this.count += 1;
  }
}
