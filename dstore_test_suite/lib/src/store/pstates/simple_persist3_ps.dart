import 'package:dstore/dstore.dart';
part 'simple_persist3_ps.ps.dstore.dart';
part 'simple_persist3_ps.g.dart';

final simplePersist3TypeName = _SimplePersist3_FullPath;

@PState(persist: true)
class $_SimplePersist3 {
  int p3 = 0;
  void setP3(int v) {
    this.p3 = v;
  }
}
