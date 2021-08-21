import 'package:dstore/dstore.dart';
part 'simple_selector_ps.ps.dstore.dart';

@WebSocketRequest(url: "1", responseDeserializer: IdentityFn)
typedef SimpleSelectorWS = WebSocketField<String, String, String>;

@PState()
class $_SimpleSelectorPS {
  int count = 0;

  StreamField<String, dynamic> streamField = StreamField<String, dynamic>();

  SimpleSelectorWS websocketField = SimpleSelectorWS();

  void increment() {
    this.count += 1;
  }

  void decrement() {
    this.count -= 1;
  }
}
