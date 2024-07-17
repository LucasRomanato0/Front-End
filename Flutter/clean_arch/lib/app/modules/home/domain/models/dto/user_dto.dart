class UserDto {
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? createAt;

  UserDto({this.id, this.name, this.phone, this.email, this.createAt});

  factory UserDto.fromMap(Map<String, dynamic> map) => UserDto(
        id: map['id'],
        name: map['name'],
        phone: map['phone'],
        email: map['email'],
        createAt: map['createAt'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'phone': phone,
        'email': email,
        'createAt': createAt,
      };
}
