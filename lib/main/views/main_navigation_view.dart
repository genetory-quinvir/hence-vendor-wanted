import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../common/common_profile_view.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({super.key, this.didTapSearch, this.didTapProfile});

  final VoidCallback? didTapSearch;
  final VoidCallback? didTapProfile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Text('HENCE Vendor Wanted', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const Spacer(),
          IconButton(
            onPressed: didTapSearch,
            icon: Icon(Ionicons.search_outline),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          buildProfileButton(),
          SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget buildProfileButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: didTapProfile,
        child: const CommonProfileView(size: 32),
      ),
    );
  }

}

extension on Widget {

  void didTapSearch() {
    didTapSearch.call();
  }

  void didTapProfile() {
    didTapProfile.call();
  }

}
