import 'package:matjarcom/globals.dart';

class User {
  int? id;
  UserAddress? userAddress;
  UserInfo? userInfo;
  User({this.id = 0, this.userAddress, this.userInfo});
  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['UID'],
      userAddress: json[kUserAddressCollectionKey],
      userInfo: json[kUserInfoCollectionKey]);
  Map<String, dynamic> toJson() => {
        'UID': id,
        kUserAddressCollectionKey: userAddress,
        kUserInfoCollectionKey: userInfo
      };
}

class UserAddress {
  String? city, region, stName;
  UserAddress({this.city, this.region, this.stName});
  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
      city: json[kCityKey], region: json[kRegionKey], stName: json[kStNameKey]);
  Map<String, dynamic> toJson() =>
      {kCityKey: city, kRegionKey: region, kStNameKey: stName};
}

class UserInfo {
  String? name, email, phone, password;
  UserInfo({this.email, this.name, this.password, this.phone});
  UserInfo.email({this.email});
  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
      name: json[kFullNameKey],
      email: json[kUserEmailKey],
      phone: json[kPhoneKey],
      password: json[kPasswordKey]);

  Map<String, dynamic> toJson() => {
        kFullNameKey: name,
        kUserEmailKey: email,
        kPhoneKey: phone,
        kPasswordKey: password
      };
}
