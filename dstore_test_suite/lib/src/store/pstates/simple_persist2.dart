import 'package:dstore/dstore.dart';
part 'simple_persist2.ps.dstore.dart';
part "simple_persist2.g.dart";

final simplePersist2TypeName = _SimplePersist2_FullPath;

@PState(persist: true)
class $_SimplePersist2 {
  int p2 = 0;
  void setP2(int v) {
    this.p2 = v;
  }
}

@JsonSerializable()
class Hello {
  final String y;
  const Hello(this.y);

  factory Hello.fromJson(Map<String, dynamic> json) => _$HelloFromJson(json);
  Map<String, dynamic> toJson() => _$HelloToJson(this);
}
