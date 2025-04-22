import 'package:flutter/material.dart';

import '../../network/network_helper.dart';
import 'main_category_cell.dart';

class MainCategoryListCell extends StatelessWidget {
  MainCategoryListCell({super.key});

  final vendorTypes = NetworkHelper.vendorTypes;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildTitle(),
          SizedBox(height: 16,),
          buildCategoryList(),
        ],
      ),   
    );
  }

  Widget buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          SizedBox(width: 16,),
          Text('카테고리', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }

  Widget buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: vendorTypes?.length ?? 0,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) => MainCategoryCell(vendorType: vendorTypes![index]),
      ),
    );
  }

}
