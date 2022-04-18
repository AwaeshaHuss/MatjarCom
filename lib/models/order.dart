import 'package:matjarcom/models/product.dart';
import 'package:matjarcom/models/user.dart';

class Order {
  int? id;
  Product? produect;
  UserAddress? userAddress;
  UserInfo? userEmail;
  Order({this.id = 0, this.produect, this.userAddress, this.userEmail});
}
