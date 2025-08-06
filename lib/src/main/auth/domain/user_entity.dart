class UserEntity {
  final String id;
  final String email;
  final String phone;
  final String displayName;
  final String? photoUrl;
  final String? token;
  final String provider;

  UserEntity({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.phone = '',
    this.token,
    required this.provider,
  });

  static UserEntity? fromJson(Map data) {
    if (data.isEmpty) return null;
    return UserEntity(
      id: data['id'] ?? '',
      email: data['email'] ?? '',
      displayName: data['displayName'] ?? '',
      photoUrl: data['photoUrl'],
      phone: data['phone'] ?? '',
      token: data['token'],
      provider: data['provider'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'phone': phone,
      'token': token,
      'provider': provider,
    };
  }
}
