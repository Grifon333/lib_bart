import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/library/widgets/inherited/provider.dart';
import 'package:lib_bart/ui/widgets/bottom_navigation/bottom_navigation_model.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
      bottomNavigationBar: _BottomNavigationBarWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(''),
    );
  }
}

class _BottomNavigationBarWidget extends StatelessWidget {
  const _BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<BottomNavigationModel>(context);
    if (model == null) return const SizedBox.shrink();

    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            size: 40,
          ),
          label: 'Profile',
          backgroundColor: MainColors.color2,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.collections_bookmark,
            size: 40,
          ),
          label: 'Books',
          backgroundColor: MainColors.color2,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            size: 40,
          ),
          label: 'Settings',
          backgroundColor: MainColors.color2,
        ),
      ],
      currentIndex: model.currentPage,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      onTap: (int val) => model.setCurrentPage(val),
    );
  }
}
