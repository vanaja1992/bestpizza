import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      String? name, 
      String? username, 
      String? email, 
      String? password, 
      String? address, 
      String? phoneNumber, 
      double? walletAmount,}){
    _name = name;
    _username = username;
    _email = email;
    _password = password;
    _address = address;
    _phoneNumber = phoneNumber;
    _walletAmount = walletAmount;
}

  UserModel.fromJson(dynamic json) {
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _password = json['password'];
    _address = json['address'];
    _phoneNumber = json['phoneNumber'];
    _walletAmount = json['wallet_amount'];
  }
  String? _name;
  String? _username;
  String? _email;
  String? _password;
  String? _address;
  String? _phoneNumber;
  double? _walletAmount;
UserModel copyWith({  String? name,
  String? username,
  String? email,
  String? password,
  String? address,
  String? phoneNumber,
  double? walletAmount,
}) => UserModel(  name: name ?? _name,
  username: username ?? _username,
  email: email ?? _email,
  password: password ?? _password,
  address: address ?? _address,
  phoneNumber: phoneNumber ?? _phoneNumber,
  walletAmount: walletAmount ?? _walletAmount,
);
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  String? get password => _password;
  String? get address => _address;
  String? get phoneNumber => _phoneNumber;
  double? get walletAmount => _walletAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['password'] = _password;
    map['address'] = _address;
    map['phoneNumber'] = _phoneNumber;
    map['wallet_amount'] = _walletAmount;
    return map;
  }

}