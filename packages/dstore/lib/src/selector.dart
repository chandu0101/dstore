class Selector<S, R> {
  final R Function(S s) fn;
  final Map<String, List<String>> deps;
  final Map<String, List<String>>? wsDeps;
  final Map<String, List<String>>? sfDeps;

  const Selector(
      {required this.fn, required this.deps, this.wsDeps, this.sfDeps});
}
