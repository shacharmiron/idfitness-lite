class Force {
  final int id;
  final String name;
  final int? parentId;

  Force({
    required this.id,
    required this.name,
    this.parentId,
  });
}
