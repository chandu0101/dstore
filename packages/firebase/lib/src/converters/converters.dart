import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference, DocumentReference> {
  const DocumentReferenceConverter();
  @override
  DocumentReference fromJson(DocumentReference json) {
    return json;
  }

  @override
  DocumentReference toJson(DocumentReference object) {
    return object;
  }
}

class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();
  @override
  GeoPoint fromJson(GeoPoint json) {
    return json;
  }

  @override
  GeoPoint toJson(GeoPoint object) {
    return object;
  }
}

class TimestampConverter implements JsonConverter<Timestamp, Timestamp> {
  const TimestampConverter();
  @override
  Timestamp fromJson(Timestamp json) {
    return json;
  }

  @override
  Timestamp toJson(Timestamp object) {
    return object;
  }
}
