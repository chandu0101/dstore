import 'package:dstore/dstore.dart';

abstract class User {
  late String name;
}

@collection(name: "movies")
abstract class Movie {
  late String poster;
  late int likes;
  late String title;
  late int year;
  late String runtime;
  late String rated;
  late List<String> genre;
  late Message messages;
  late FireStoreRef<Message> mRef;
}

@collection(name: "messages", sub: true)
abstract class Message {
  late String createdAt;
  late String author;
}

abstract class FCollections implements Movie, Message {}
