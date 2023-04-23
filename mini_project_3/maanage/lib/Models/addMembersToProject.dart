class Members {
  final String? id;
  final String? name;

  Members({
    this.id,
    this.name,
  });
  @override
  String toString() {
    return '{id: $id, name: $name}';
  }
}
