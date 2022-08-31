class UserModel {
  final int id;
  final String name;
  final String username;
  final String phoneNumber;
  final String address;
  final String email;

  UserModel(
      {required this.id,
        required this.name,
        required this.username,
        required this.phoneNumber,
        required this.address,
        required this.email});

  UserModel copyWith({int? id, String? name, String? username, String? phoneNumber, String? address, String? email}) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        email: email ?? this.email);
  }

  factory UserModel.fromJson(dynamic json) => UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      phoneNumber: json['phone'],
      address: json['address']['street'],
      email: json['email']);

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['phone'] = phoneNumber;
    map['address']['street'] = address;
    map['email'] = email;
    return map;
  }
}
