import 'package:flutter/material.dart';
import 'main_emergnecy_recruit_cell.dart';

class MainEmergencyRecruitListCell extends StatelessWidget {
  const MainEmergencyRecruitListCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildTitle(),
          buildList(),
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
          Text('긴급 모집', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }

  Widget buildList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => MainEmergencyRecruitCell(didTapCell: didTapCell),
      separatorBuilder: (context, index) => SizedBox(height: 0),
      itemCount: 3,
    );
  }

  void didTapCell() {
    print('didTapCell');
  }

}
