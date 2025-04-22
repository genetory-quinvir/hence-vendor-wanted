import 'package:flutter/material.dart';

import '../common/common_navigation_view.dart';
import 'views/sign_provider_button.dart';

enum SignProviderType {
  kakao,
  naver,
  google,
  apple;

  String get title {
    switch (this) {
      case SignProviderType.kakao:
        return '카카오로 연결하기';
      case SignProviderType.naver:
        return '네이버로 연결하기';
      case SignProviderType.google:
        return '구글로 연결하기';
      case SignProviderType.apple:
        return '애플로 연결하기';
    }
  }

}

class SignProviderView extends StatelessWidget {
  const SignProviderView({super.key});

  final List<SignProviderType> providers = SignProviderType.values;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildNavigationView(context),
            Spacer(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: buildProviderList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavigationView(BuildContext context) {
    return CommonNavigationView(
      rightIcon: Icons.close,
      didTapRight: () => Navigator.pop(context),
      title: 'Sign Provider',
    );
  }

  Widget buildProviderList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: providers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return SignProviderButton(type: providers[index], didTap: didTapProvider);
      },
    );
  }

  void didTapProvider(SignProviderType type) {
    print(type);
  }
  
}
  