class UserItem {
  final String id;
  final String name;
  final String? profileImageUrl;

  UserItem({
    required this.id,
    required this.name,
    this.profileImageUrl,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) {
    return UserItem(
      id: json['id'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profileImageUrl': profileImageUrl,
    };
  }

  @override
  String toString() {
    return '{id: $id, name: $name, profileImageUrl: $profileImageUrl}';
  }
}
