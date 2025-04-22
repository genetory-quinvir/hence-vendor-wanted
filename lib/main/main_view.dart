import 'package:flutter/material.dart';
import 'package:hence_vendor_wanted/main/views/main_navigation_view.dart';
import 'package:hence_vendor_wanted/search/search_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../sign/sign_provider_view.dart';
import 'cells/main_category_list_cell.dart';
import 'cells/main_emergency_recruit_list_cell.dart';
import 'cells/main_top_banner_cell.dart';

enum MainViewSectionType {
  topBanner,
  categories,
  emergencyRecruit;

  String get title {
    switch (this) {
      case MainViewSectionType.topBanner:
        return 'Top Banner';
      case MainViewSectionType.categories:
        return '카테고리';
      case MainViewSectionType.emergencyRecruit:
        return '긴급 모집';
    }
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  final List<MainViewSectionType> sections = MainViewSectionType.values;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {  

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildNavigationView(context),
            Expanded(
              child: Container(
                color: Colors.white,
                child: buildListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavigationView(BuildContext context) {
    return MainNavigationView(
      didTapSearch: () => showSearchView(context),
      didTapProfile: () => showSignProviderView(context),
    );
  }

  Widget buildListView() {
    return ListView.separated(
      itemCount: widget.sections.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) => 
      switch (widget.sections[index]) {
        MainViewSectionType.topBanner => MainTopBannerCell(),
        MainViewSectionType.categories => MainCategoryListCell(),
        MainViewSectionType.emergencyRecruit => MainEmergencyRecruitListCell(),
      },
    );
  }


}   

extension Present on _MainViewState {

  void showSignProviderView(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context, 
      builder: (context) => SignProviderView(),
      duration: const Duration(milliseconds: 300),
      enableDrag: false,
    );
  }

  void showSearchView(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context, 
      builder: (context) => SearchView(),
      duration: const Duration(milliseconds: 300),
      enableDrag: false,
    );
  }

}
