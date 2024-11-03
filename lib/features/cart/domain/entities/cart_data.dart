import 'package:hive/hive.dart';

part 'cart_data.g.dart';

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final double price;

  CartItem(
      {required this.id, required this.name, required this.price , required this.image,});
}
