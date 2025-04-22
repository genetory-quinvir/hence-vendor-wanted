import 'package:flutter/material.dart';
import 'main/main_view.dart';
import 'models/vendor_type_item.dart';
import 'network/network_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // 벤더 타입 데이터 로드
    final List<VendorTypeItem> vendorTypes = await NetworkHelper.getVendorTypes();
    for (var i = 0; i < vendorTypes.length; i++) {
      print('벤더 타입 $i: ${vendorTypes[i].type} - ${vendorTypes[i].name}');
    }
  } catch (e) {
    print('벤더 타입 로드 실패: $e');
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainView(),
    );
  }
}
