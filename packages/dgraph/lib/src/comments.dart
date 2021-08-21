import 'dart:convert';

class DgraphAuthorizationComment {
  final String header;
  final String namespace;
  final String algo;
  final String verificationKey;
  final String? jwkurl;
  final List<String>? jwkurls;
  final List<String> audience;
  final bool closedByDefault;

  const DgraphAuthorizationComment(
      {required this.header,
      required this.namespace,
      required this.algo,
      required this.verificationKey,
      this.jwkurl,
      this.jwkurls,
      this.audience = const [],
      this.closedByDefault = false});

  @override
  String toString() {
    final params = <String>[];
    params.add('"Header":"$header"');
    params.add('"Namespace":"$namespace"');
    params.add('"Algo":"$algo"');
    params.add('"VerificationKey":"$verificationKey"');
    params.add('"Audience":${jsonEncode(audience)}');
    if (closedByDefault) {
      params.add('"ClosedByDefault":true');
    }
    if (jwkurl != null) {
      params.add('"jwkurl":"$jwkurl"');
    } else if (jwkurls != null) {
      params.add('"jwkurls":${jsonEncode(jwkurls)}');
    }
    return '# Dgraph.Authorization {${params.join(", ")}}';
  }
}
