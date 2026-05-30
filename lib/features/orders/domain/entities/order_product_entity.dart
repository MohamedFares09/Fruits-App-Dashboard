class OrderProductEntity {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String code;

  const OrderProductEntity({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.code,
  });
}
