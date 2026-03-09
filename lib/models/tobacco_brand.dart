class TobaccoBrand {
  final String name;
  final String type;
  final double price;
  final String imageUrl;
  final String? tag;

  const TobaccoBrand({
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
    this.tag,
  });
}
