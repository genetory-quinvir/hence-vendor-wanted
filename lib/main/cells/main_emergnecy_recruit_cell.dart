import 'package:flutter/material.dart';
import 'package:hence_vendor_wanted/common/common_profile_view.dart';

class MainEmergencyRecruitCell extends StatelessWidget {
  const MainEmergencyRecruitCell({super.key, required this.didTapCell});

  final VoidCallback didTapCell;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => didTapCell(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
          children: [
            Row(
              children: [
                CommonProfileView(size: 24),
                SizedBox(width: 6,),
                Text('신비한 페스티벌', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey[900]),),
              ],
            ),
            SizedBox(height: 8,),
            Text('[서울 홍대] 실내프리마켓 퍼니마켓 // 소품샵 위탁판매 //홍대입구역 9번출구 패션거리 // 4월 21일 ~ 4월 27일까지 4월3주차 모집공고', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black), maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left,),
            SizedBox(height: 8,),
            Row(
              children: [
                Text('25. 04. 22', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey[400]),),
                Spacer(),
                Text('조회수 123', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey[400]),),
              ],
            ),
            SizedBox(height: 12,),
              Divider(color: Colors.grey[100], height: 1,)
            ],
          ),
        ),
      ),
    );
  }
}