import 'package:flutter/material.dart';
import '../models/vendor_item.dart';

class CommonVendorItemView extends StatelessWidget {
  const CommonVendorItemView({super.key, required this.vendorItem});

  final VendorItem vendorItem;

  @override
  Widget build(BuildContext context) {
    return buildVendorItemView();
  }
}

extension UI on CommonVendorItemView {

  Widget buildVendorItemView() {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          Text(vendorItem.name),
        ],
      ),
    );
  }
  
}

extension Event on CommonVendorItemView {

}

extension Network on CommonVendorItemView {

}