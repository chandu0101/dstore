# dstore

State management for dart apps.

Features : 
*  Synchronus Actions
*  Asynchronus Actions
*  Http Middleware (supports gaphql, upload download progress)
*  Code generation for graphql queries(which are typesafe via dsl)
*  Code generation for openapi spec
*  Grpahql schema generation for dgraph
*  Easy to use flutter widgets, and supports forms(text,radio,checkbox,date picker,slider, range slider )
*  Undo Redo of state.
*  Cross plarform navigation (with blocking url, login protection, nested stacks ,etc)
*  https://docs.flutter.dev/tools/devtools/extensions
- [ ]   Multi Threading (thread pools, web workers) check typesafe-store implementation
- [ ]   implement hash code for more than 20 variables
- [ ]   analaysis_option.yaml should exclude .dstrore.dart files
- [ ]   pagination debounce throttling
- [ ]   offline actions check tstore
- [ ]   https://github.com/mukhbit0/flutter_route_shifter , route transitions


- [ ] [Jaspr](https://github.com/schultek/jaspr) glue
- [ ] https://onlyflutter.com/how-to-store-data-in-secure-storage-in-flutter/#h-flutter-secure-storage-plugin
- [ ] check hot reload , mostly shortcircuit of Selector
- [ ] [fluttercon USA offline first recording](https://flutterconusa.dev/agenda/)

implement bloc concurrent https://github.com/felangel/bloc/tree/master/packages/bloc_concurrency


pagination: 

https://dinkomarinac.dev/riverpod-pagination-the-ultimate-guide-for-flutter-developers

# Get Feature Parity with Tstore
- [ ] Thread Pools and workers https://github.com/d-markey/squadron
- [ ] Devtools
- [ ] GRPC module(check bacup branch)
- [ ] Flatbuffers

# Feature Parity with riverpod
- [ ]https://github.com/rrousselGit/riverpod

# Databases

Firebase rules typesafe

SupaBase

NeonDB

Postgres

MongoDB

https://surrealdb.com/

# persistent dbs
https://github.com/simolus3/drift/

Sqlite

shared_pref

hive

https://github.com/isar/isar

https://github.com/tursodatabase/libsql/blob/main/docs/HRANA_3_SPEC.md

https://github.com/celest-dev/hrana.dart

#  Perf

https://github.com/mraleph/dart_simdjson
