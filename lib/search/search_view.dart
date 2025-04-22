import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../common/common_navigation_view.dart';
import '../common/common_search_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  bool _hasSearchText = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _hasSearchText = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildNavigationView(context),
            buildSearchView(),
            Expanded(
              child: _hasSearchText 
                  ? buildSearchResults() 
                  : buildPopularKeywordsView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavigationView(BuildContext context) {
    return CommonNavigationView(
      rightIcon: Ionicons.close_outline,
      didTapRight: () => Navigator.pop(context),
      title: '검색하기',
    );
  }

  Widget buildSearchView() {
    return CommonSearchView(
      controller: _searchController,
    );
  }
  
  Widget buildPopularKeywordsView() {
    final List<String> popularKeywords = [
      '인기검색어1', '인기검색어2', '인기검색어3', 
      '인기검색어4', '인기검색어5', '인기검색어6'
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '인기 검색어',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12),
        Expanded(
          child: ListView.separated(
            itemCount: popularKeywords.length,
            separatorBuilder: (context, index) => SizedBox(height: 0),
            itemBuilder: (context, index) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    _searchController.text = popularKeywords[index];
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      popularKeywords[index], 
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  
  Widget buildSearchResults() {
    return Center(
      child: Text('검색 결과가 여기에 표시됩니다.'),
    );
  }
}
