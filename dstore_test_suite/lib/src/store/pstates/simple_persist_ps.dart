import 'package:dstore/dstore.dart';
part 'simple_persist_ps.ps.dstore.dart';
part "simple_persist_ps.g.dart";

final simplePersistTypeName = _SimplePersist_FullPath;

@PState(persist: true)
class $_SimplePersist {
  int x = 0;

  void setX(int v) {
    this.x = v;
  }
}
