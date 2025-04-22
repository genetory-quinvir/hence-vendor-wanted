import 'package:flutter/material.dart';
import 'package:hence_vendor_wanted/common/common_navigation_view.dart';
import 'package:ionicons/ionicons.dart';
import '../common/common_vendor_item_view.dart';
import '../models/vendor_item.dart';
import '../models/vendor_type_item.dart';
import '../network/network_helper.dart';

enum VendorListViewType {
  vendorType
}

class VendorListView extends StatefulWidget {
  const VendorListView({super.key, required this.vendorType, required this.type});

  final VendorTypeItem? vendorType;
  final VendorListViewType type;
  
  @override
  State<VendorListView> createState() => _VendorListViewState();
}

class _VendorListViewState extends State<VendorListView> {

  bool isLoading = false;
  List<VendorItem> vendorItems = [];

  @override
  void initState() {
    super.initState();

    loadVendorList();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              buildNavigationView(context),
              Expanded(child: buildListView(context)),
            ],
          ),
        ),
      ),
    );
  }
  
}

extension UI on _VendorListViewState {
 
  Widget buildNavigationView(BuildContext context) {
    return CommonNavigationView(
      title: widget.vendorType?.name ?? '',
      leftIcon: Ionicons.arrow_back_outline,
      didTapLeft: () => didTapLeft(context),
    );
  }

  Widget buildListView(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CommonVendorItemView(vendorItem: vendorItems[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 0),
      itemCount: vendorItems.length,
    );
  }   
  
}

extension Event on _VendorListViewState {

  void didTapLeft(BuildContext context) {
    Navigator.pop(context);
  }
  
}

extension Network on _VendorListViewState {
  
  Future<void> loadVendorList() async {
    if (isLoading) return;
    
    setState(() {
      isLoading = true;
      // errorMessage = null;
    });
    
    try {
      print("벤더 목록 로드 시작 - 타입: ${widget.vendorType?.type}");
      
      // ApiResponse<VendorListItem> 타입으로 응답 받음
      final response = await NetworkHelper.getVendorList(
        null, // 검색어 없음
        widget.vendorType?.type, // 선택한 벤더 타입
        "latest" // 정렬 기준 없음
      );
      
      setState(() {
        // response.data는 VendorListItem 타입
        vendorItems = response.data.items;
        isLoading = false;
      });
      
      print("벤더 목록 로드 완료: ${vendorItems.length}개 항목");
    } catch (e) {
      print("벤더 목록 로드 실패: $e");
      setState(() {
        // errorMessage = '벤더 목록을 불러오는 데 실패했습니다.\n$e';
        isLoading = false;
      });
    }
  }

}