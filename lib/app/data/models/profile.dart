import 'dart:convert';

class Profile {
  final String id;
  final String username;
  final DateTime createdAt;
  Profile({
    required this.id,
    required this.username,
    required this.createdAt,
  });

  Profile copyWith({
    String? id,
    String? username,
    DateTime? createdAt,
  }) {
    return Profile(
      id: id ?? this.id,
      username: username ?? this.username,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        username = map['username'] ?? '',
        createdAt = DateTime.fromMillisecondsSinceEpoch(map['createdAt']);

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));

  @override
  String toString() =>
      'Profile(id: $id, username: $username, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Profile &&
        other.id == id &&
        other.username == username &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ createdAt.hashCode;
}
