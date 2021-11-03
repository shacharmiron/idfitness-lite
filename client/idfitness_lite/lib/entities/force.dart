class Force {
  final int id;
  final String name;
  final Force? parent;

  Force({
    required this.id,
    required this.name,
    this.parent,
  });
}
