class Message {
  final String id;
  final String profileId;
  final String content;
  final DateTime createdAt;
  final bool isMine;
  Message({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
  });

  Message copyWith({
    String? id,
    String? profileId,
    String? content,
    DateTime? createdAt,
    bool? isMine,
  }) {
    return Message(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isMine: isMine ?? this.isMine,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profileId': profileId,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isMine': isMine,
    };
  }

  Message.fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  })  : id = map['id'] ?? '',
        profileId = map['profileId'] ?? '',
        content = map['content'] ?? '',
        createdAt = DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
        isMine = myUserId == map['profileId'];

  @override
  String toString() {
    return 'Message(id: $id, profileId: $profileId, content: $content, createdAt: $createdAt, isMine: $isMine)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.id == id &&
        other.profileId == profileId &&
        other.content == content &&
        other.createdAt == createdAt &&
        other.isMine == isMine;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        profileId.hashCode ^
        content.hashCode ^
        createdAt.hashCode ^
        isMine.hashCode;
  }
}
