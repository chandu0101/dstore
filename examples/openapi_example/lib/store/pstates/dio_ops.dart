import 'package:dstore/dstore.dart';
import "../api/open_api/banking.dart";

part "dio_ops.ps.dstore.dart";

@PState()
class $_DioOps {
  GetAccounts getAccount = GetAccounts();
}
