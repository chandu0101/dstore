import 'package:dstore/dstore.dart';
import "package:json_annotation/json_annotation.dart";

part "banking.api.dstore.dart";
part "banking.g.dart";

@OpenApi(file: "./account.json")
class BankingApi {}
