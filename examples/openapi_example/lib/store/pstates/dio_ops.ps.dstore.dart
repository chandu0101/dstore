// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_ops.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class DioOps extends PStateModel<DioOps> {
  final GetAccounts getAccount;

  _$DioOpsCopyWith<DioOps> get copyWith =>
      __$DioOpsCopyWithImpl<DioOps>(this, IdentityFn);

  DioOps({this.getAccount = const GetAccounts()});

  @override
  DioOps copyWithMap(Map<String, dynamic> map) => DioOps(
      getAccount: map.containsKey("getAccount")
          ? map["getAccount"] as GetAccounts
          : this.getAccount);

  Map<String, dynamic> toMap() =>
      <String, dynamic>{"getAccount": this.getAccount};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is DioOps && o.getAccount == getAccount;
  }

  @override
  int get hashCode => getAccount.hashCode;

  @override
  String toString() => "DioOps(getAccount: ${this.getAccount})";
}

abstract class $DioOpsCopyWith<O> {
  factory $DioOpsCopyWith(DioOps value, O Function(DioOps) then) =
      _$DioOpsCopyWithImpl<O>;
  O call({GetAccounts getAccount});
}

class _$DioOpsCopyWithImpl<O> implements $DioOpsCopyWith<O> {
  final DioOps _value;
  final O Function(DioOps) _then;
  _$DioOpsCopyWithImpl(this._value, this._then);

  @override
  O call({Object? getAccount = dimmutable}) {
    return _then(_value.copyWith(
        getAccount: getAccount == dimmutable
            ? _value.getAccount
            : getAccount as GetAccounts));
  }
}

abstract class _$DioOpsCopyWith<O> implements $DioOpsCopyWith<O> {
  factory _$DioOpsCopyWith(DioOps value, O Function(DioOps) then) =
      __$DioOpsCopyWithImpl<O>;
  O call({GetAccounts getAccount});
}

class __$DioOpsCopyWithImpl<O> extends _$DioOpsCopyWithImpl<O>
    implements _$DioOpsCopyWith<O> {
  __$DioOpsCopyWithImpl(DioOps _value, O Function(DioOps) _then)
      : super(_value, (v) => _then(v));

  @override
  DioOps get _value => super._value;

  @override
  O call({Object? getAccount = dimmutable}) {
    return _then(DioOps(
        getAccount: getAccount == dimmutable
            ? _value.getAccount
            : getAccount as GetAccounts));
  }
}

const _DioOps_FullPath = "/store/pstates/dio_ops/DioOps";

abstract class DioOpsActions {
  static Action<
          HttpField<Null, OBReadAccount6Object, GetAccountsResponse_Error>>
      getAccount(
          {bool abortable = false,
          bool silent = false,
          bool offline = false,
          Map<String, dynamic>? headers,
          OBReadAccount6Object? optimisticResponse,
          HttpField<Null, OBReadAccount6Object, GetAccountsResponse_Error>?
              mock,
          Duration? debounce}) {
    return Action<
            HttpField<Null, OBReadAccount6Object, GetAccountsResponse_Error>>(
        name: "getAccount",
        type: _DioOps_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, Null, OBReadAccount6Object,
                GetAccountsResponse_Error, dynamic>(
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "/open-banking/v3.1/aisp/accounts",
            method: "GET",
            responseType: HttpResponseType.JSON),
        debounce: debounce);
  }

  static Action<
      HttpField<Null, OBReadAccount6Object,
          GetAccountsResponse_Error>> getAccountMock(
      HttpField<Null, OBReadAccount6Object, GetAccountsResponse_Error> mock) {
    return Action<
            HttpField<Null, OBReadAccount6Object, GetAccountsResponse_Error>>(
        name: "getAccount", type: _DioOps_FullPath, mock: mock);
  }
}

DioOps DioOps_DS() => DioOps(getAccount: GetAccounts());

final DioOpsMeta =
    PStateMeta<DioOps>(type: _DioOps_FullPath, ds: DioOps_DS, httpMetaMap: {
  "getAccount": HttpMeta<Null, Null, Null, OBReadAccount6Object,
          GetAccountsResponse_Error, dynamic>(
      responseSerializer: OBReadAccount6Object.toJsonStatic,
      responseDeserializer: OBReadAccount6Object.fromJsonStatic)
});
