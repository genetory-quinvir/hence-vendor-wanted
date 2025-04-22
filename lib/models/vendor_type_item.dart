class VendorTypeItem {
  final String type;
  final String name;
  final String thumbImageUrl;

  VendorTypeItem({required this.type, required this.name, required this.thumbImageUrl});

  factory VendorTypeItem.fromJson(Map<String, dynamic> json) {
    return VendorTypeItem(
      type: json['type'],
      name: json['name'],
      thumbImageUrl: json['thumbImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'thumbImageUrl': thumbImageUrl,
    };
  }

  @override
  String toString() {
    return '{type: $type, name: $name, thumbImageUrl: $thumbImageUrl}';
  }
}
