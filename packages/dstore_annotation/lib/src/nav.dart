class Url {
  final String path;
  final Type? nestedType;
  final bool isProtected;

  const Url(this.path, {this.nestedType, this.isProtected = false});
}

// for native platforms if not using url then use this
class Protected {
  const Protected();
}
