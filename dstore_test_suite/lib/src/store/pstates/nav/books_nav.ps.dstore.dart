// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_nav.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

class BooksNav extends NestedNavStateI<BooksNav>
    with PStateStoreDepsMixin, NavCommonI {
  final Page? page;

  final BeforeLeaveFn? beforeLeave;

  final NavConfigMeta meta;

  final NavOptions? navOptions;

  final bool listP;

  final String? selectedBook;

  final String? author;

  @override
  void initialSetup() {
    throw UnimplementedError(
        "This method stubbed out as action BooksNavActions.initialSetup() , use that action instead");
  }

  @override
  List<Page> buildPages() {
    print("building booksPages selectedBook ${selectedBook}");
    return [
      MaterialPage<dynamic>(key: ValueKey("books"), child: BooksListScreen()),
      if (selectedBook != null)
        MaterialPage<dynamic>(
            key: ValueKey("books/:id"), child: BookDetailsScreen())
    ];
  }

  _$BooksNavCopyWith<BooksNav> get copyWith =>
      __$BooksNavCopyWithImpl<BooksNav>(this, IdentityFn);

  BooksNav(
      {this.page,
      this.beforeLeave,
      NavConfigMeta? meta,
      this.navOptions,
      this.listP = false,
      this.selectedBook,
      this.author})
      : meta = meta ?? NavConfigMeta();

  @override
  BooksNav copyWithMap(Map<String, dynamic> map) => BooksNav(
      page: map.containsKey("page") ? map["page"] as Page? : this.page,
      beforeLeave: map.containsKey("beforeLeave")
          ? map["beforeLeave"] as BeforeLeaveFn?
          : this.beforeLeave,
      meta: map.containsKey("meta") ? map["meta"] as NavConfigMeta : this.meta,
      navOptions: map.containsKey("navOptions")
          ? map["navOptions"] as NavOptions?
          : this.navOptions,
      listP: map.containsKey("listP") ? map["listP"] as bool : this.listP,
      selectedBook: map.containsKey("selectedBook")
          ? map["selectedBook"] as String?
          : this.selectedBook,
      author:
          map.containsKey("author") ? map["author"] as String? : this.author);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "page": this.page,
        "beforeLeave": this.beforeLeave,
        "meta": this.meta,
        "navOptions": this.navOptions,
        "listP": this.listP,
        "selectedBook": this.selectedBook,
        "author": this.author
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is BooksNav &&
        o.page == page &&
        o.beforeLeave == beforeLeave &&
        o.meta == meta &&
        o.navOptions == navOptions &&
        o.listP == listP &&
        o.selectedBook == selectedBook &&
        o.author == author;
  }

  @override
  int get hashCode =>
      page.hashCode ^
      beforeLeave.hashCode ^
      meta.hashCode ^
      navOptions.hashCode ^
      listP.hashCode ^
      selectedBook.hashCode ^
      author.hashCode;

  @override
  String toString() =>
      "BooksNav(page: ${this.page}, beforeLeave: ${this.beforeLeave}, meta: ${this.meta}, navOptions: ${this.navOptions}, listP: ${this.listP}, selectedBook: ${this.selectedBook}, author: ${this.author})";
}

abstract class $BooksNavCopyWith<O> {
  factory $BooksNavCopyWith(BooksNav value, O Function(BooksNav) then) =
      _$BooksNavCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions,
      bool listP,
      String? selectedBook,
      String? author});
}

class _$BooksNavCopyWithImpl<O> implements $BooksNavCopyWith<O> {
  final BooksNav _value;
  final O Function(BooksNav) _then;
  _$BooksNavCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? navOptions = dimmutable,
      Object? listP = dimmutable,
      Object? selectedBook = dimmutable,
      Object? author = dimmutable}) {
    return _then(_value.copyWith(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as NavOptions?,
        listP: listP == dimmutable ? _value.listP : listP as bool,
        selectedBook: selectedBook == dimmutable
            ? _value.selectedBook
            : selectedBook as String?,
        author: author == dimmutable ? _value.author : author as String?));
  }
}

abstract class _$BooksNavCopyWith<O> implements $BooksNavCopyWith<O> {
  factory _$BooksNavCopyWith(BooksNav value, O Function(BooksNav) then) =
      __$BooksNavCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions,
      bool listP,
      String? selectedBook,
      String? author});
}

class __$BooksNavCopyWithImpl<O> extends _$BooksNavCopyWithImpl<O>
    implements _$BooksNavCopyWith<O> {
  __$BooksNavCopyWithImpl(BooksNav _value, O Function(BooksNav) _then)
      : super(_value, (v) => _then(v));

  @override
  BooksNav get _value => super._value;

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? navOptions = dimmutable,
      Object? listP = dimmutable,
      Object? selectedBook = dimmutable,
      Object? author = dimmutable}) {
    return _then(BooksNav(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as NavOptions?,
        listP: listP == dimmutable ? _value.listP : listP as bool,
        selectedBook: selectedBook == dimmutable
            ? _value.selectedBook
            : selectedBook as String?,
        author: author == dimmutable ? _value.author : author as String?));
  }
}

const _BooksNav_FullPath = "/store/pstates/nav/books_nav/BooksNav";
dynamic BooksNav_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as BooksNav;
  final name = _DstoreAction.name;
  switch (name) {
    case "details":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final id = _DstoreActionPayload["id"] as String;

        var _DStore_selectedBook = _DStoreState.selectedBook;
        var _DStore_author = _DStoreState.author;
        _DStore_selectedBook = id;
        _DStore_author = null;
        _DStoreState.meta.beforeLeave = bookDetailsBeforeLeave;
        var newState = _DStoreState.copyWith(
            selectedBook: _DStore_selectedBook, author: _DStore_author);

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/books/$id';

        return newState;
      }

    case "detailsAuthor":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final id = _DstoreActionPayload["id"] as String;
        final name = _DstoreActionPayload["name"] as String;

        var _DStore_author = _DStoreState.author;
        _DStore_author = name;
        var newState = _DStoreState.copyWith(
            author: _DStore_author, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/books/$id/$name';

        return newState;
      }

    case "initialSetup":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_selectedBook = _DStoreState.selectedBook;
        _DStore_selectedBook = null;
        var newState = _DStoreState.copyWith(
            selectedBook: _DStore_selectedBook, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = null;

        return newState;
      }

    default:
      {
        return _DStoreState;
      }
  }
}

BooksNav BooksNav_DS() {
  final state = BooksNav(
      page: null,
      beforeLeave: null,
      meta: NavConfigMeta(),
      navOptions: null,
      listP: false,
      selectedBook: null,
      author: null);

  state.dontTouchMe.staticMeta = {};
  state.dontTouchMe.dynamicMeta = {
    '/books/:id': NavUrlMeta(
        url: '/books/:id',
        urlToAction: (Uri uri, Dispatch dispatch) {
          final path = uri.path;
          final parameters = <String>[];
          final regExp = pathToRegExp('/books/:id', parameters: parameters);
          final match = regExp.matchAsPrefix(path);
          final params = extract(parameters, match!);
          return dispatch(BooksNavActions.details(id: params['id']!));
        },
        isProtected: false),
    '/books/:id/:name': NavUrlMeta(
        url: '/books/:id/:name',
        urlToAction: (Uri uri, Dispatch dispatch) {
          final path = uri.path;
          final parameters = <String>[];
          final regExp =
              pathToRegExp('/books/:id/:name', parameters: parameters);
          final match = regExp.matchAsPrefix(path);
          final params = extract(parameters, match!);
          return dispatch(BooksNavActions.detailsAuthor(
              id: params['id']!, name: params['name']!));
        },
        isProtected: false)
  };
  state.dontTouchMe.typeName = '/store/pstates/nav/books_nav/BooksNav';
  state.dontTouchMe.initialSetup = BooksNavActions.initialSetup(silent: true);
  state.dontTouchMe.historyMode = HistoryMode.stack;

  return state;
}

final BooksNavMeta = PStateMeta<BooksNav>(
    type: _BooksNav_FullPath, reducer: BooksNav_SyncReducer, ds: BooksNav_DS);

abstract class BooksNavActions {
  static Action<dynamic> details(
      {required String id, bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "details",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions, rawUrl: '/books/:id', isProtected: false),
        type: _BooksNav_FullPath,
        payload: <String, dynamic>{"id": id},
        isAsync: false);
  }

  static Action<dynamic> detailsAuthor(
      {required String id,
      required String name,
      bool silent = false,
      NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "detailsAuthor",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions,
            rawUrl: '/books/:id/:name',
            isProtected: false),
        type: _BooksNav_FullPath,
        payload: <String, dynamic>{"id": id, "name": name},
        isAsync: false);
  }

  static Action<dynamic> initialSetup(
      {bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "initialSetup",
        silent: silent,
        nav: NavPayload(navOptions: navOptions, isProtected: false),
        type: _BooksNav_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }
}
