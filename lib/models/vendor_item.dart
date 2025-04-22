import 'user_item.dart';

class VendorListItem {
  final List<VendorItem> items;
  final String? nextCursor;
  final bool hasNext;
  
  VendorListItem({
    required this.items,
    this.nextCursor,
    required this.hasNext,
  });
  
  factory VendorListItem.fromJson(dynamic json) {
    if (json == null) {
      return VendorListItem(items: [], nextCursor: null, hasNext: false);
    }
    
    List<VendorItem> items = [];
    if (json['items'] != null && json['items'] is List) {
      items = (json['items'] as List)
          .map((item) => VendorItem.fromJson(item))
          .toList();
    }
    
    return VendorListItem(
      items: items,
      nextCursor: json['nextCursor'],
      hasNext: json['hasNext'] ?? false,
    );
  }
}

class VendorItem {
  final String id;
  final UserItem user;
  final String name;
  final String type;
  final String? description;
  final String? businessNumber;
  final String? contactNumber;
  final String? thumbImageUrl;
  final double? averageRating;
  final int reviewCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  VendorItem({
    required this.id,
    required this.user,
    required this.name,
    required this.type,
    this.description,
    this.businessNumber,
    this.contactNumber,
    this.thumbImageUrl,
    this.averageRating,
    required this.reviewCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VendorItem.fromJson(Map<String, dynamic> json) {
    return VendorItem(
      id: json['id'],
      user: UserItem.fromJson(json['user']),
      name: json['name'],
      type: json['type'],
      description: json['description'],
      businessNumber: json['businessNumber'],
      contactNumber: json['contactNumber'],
      thumbImageUrl: json['thumbImageUrl'],
      averageRating: json['averageRating'] != null 
          ? double.parse(json['averageRating'].toString()) 
          : null,
      reviewCount: json['reviewCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'name': name,
      'type': type,
      'description': description,
      'businessNumber': businessNumber,
      'contactNumber': contactNumber,
      'thumbImageUrl': thumbImageUrl,
      'averageRating': averageRating,
      'reviewCount': reviewCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return '{id: $id, name: $name, type: $type, averageRating: $averageRating, reviewCount: $reviewCount}';
  }
}
