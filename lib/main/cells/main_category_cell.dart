import 'package:flutter/material.dart';
import '../../models/vendor_type_item.dart';
import '../../vendor/vendor_list_view.dart';

class MainCategoryCell extends StatelessWidget {
  const MainCategoryCell({super.key, required this.vendorType});

  final VendorTypeItem vendorType;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => VendorListView(vendorType: vendorType, type: VendorListViewType.vendorType)));
        },
        child: Container(
          alignment: Alignment.center,
          child: Container(
        height: 100,
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          image: vendorType.thumbImageUrl.isNotEmpty
              ? DecorationImage(
                  image: NetworkImage(vendorType.thumbImageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                )
              : null,
        ),
        child: Center(
          child: Text(
            vendorType.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
  