import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CommonSearchView extends StatefulWidget {
  final TextEditingController? controller;
  
  const CommonSearchView({super.key, this.controller});
  
  @override
  _CommonSearchViewState createState() => _CommonSearchViewState();
}

class _CommonSearchViewState extends State<CommonSearchView> {
  late TextEditingController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }
  
  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 12),
            Icon(Ionicons.search_outline, size: 20),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '검색어를 입력해 주세요.',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: _controller.text.isEmpty 
                      ? null 
                      : IconButton(
                          icon: Icon(Ionicons.close_circle, color: Colors.grey[400]),
                          onPressed: () {
                            _controller.clear();
                            setState(() {});
                          },
                        ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  isDense: true,
                ),
                onChanged: (text) {
                  setState(() {});
                },
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}