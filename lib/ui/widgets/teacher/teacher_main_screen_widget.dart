import 'package:flutter/material.dart';

import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/domain/factories/screen_factory.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class TeacherMainScreenWidget extends StatefulWidget {
  const TeacherMainScreenWidget({super.key});

  @override
  State<TeacherMainScreenWidget> createState() =>
      _TeacherMainScreenWidgetState();
}

class _TeacherMainScreenWidgetState extends State<TeacherMainScreenWidget> {
  int _selectedTab = 0;
  final _screenFactory = ScreenFactory();

  void _onSelectedTab(int index) {
    if (_selectedTab == index) return;
    _selectedTab = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart University'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              SessionDataProvider().deleteTokenUser().then(
                    (value) => MainNavigation.resetNavigation(context),
                  )
            },
            icon: const Icon(Icons.logout_sharp),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          _screenFactory.makeYuklamaScreen(),
          // _screenFactory.makeAnketaScreen(model.teacherId),
          // _screenFactory.makeBilimlarBazasiScreen(model.teacherId),
          _screenFactory.makeIlmiyIshlarScreen(),
          _screenFactory.makeOquvUslubiyIshlarScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Yuklama'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article), label: "Ilmiy ishlar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note), label: "O'quv uslubiy ishlar"),
        ],
        onTap: _onSelectedTab,
      ),
    );
  }
}
