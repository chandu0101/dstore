import 'package:dstore/dstore.dart';
import 'package:meta/meta.dart';
part 'snack.ps.dstore.dart';

@PState()
class $_SnackState {
  String message = "";

  void setMessage(String message) {
    this.message = message;
  }
}
