import 'package:flutter/material.dart';
import 'package:samduapp/domain/data_providers/session_data_provider.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';
import 'package:samduapp/domain/factories/screen_factory.dart';
import 'package:samduapp/ui/widgets/admin/search_screen.dart';

class AdminMainScreenWidget extends StatefulWidget {
  const AdminMainScreenWidget({super.key});

  @override
  State<AdminMainScreenWidget> createState() => _AdminMainScreenWidgetState();
}

class _AdminMainScreenWidgetState extends State<AdminMainScreenWidget> {
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
          const SearchScreen(),
          _screenFactory.makeFakultetScreen(),
          _screenFactory.makeFakultetScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Fakultet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Account')
        ],
        onTap: _onSelectedTab,
      ),
    );
  }
}
