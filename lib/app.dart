import 'package:flutter/material.dart';
import 'package:recipe/screens/categories.dart';
import 'package:recipe/screens/dashboard.dart';
import 'package:recipe/screens/home_page.dart';


class Home extends StatefulWidget {
  static const routeName = "home-page";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;
  @override
  void initState() {
    super.initState();
    _listPages..add(HomePage())..add(Categories())..add(Dashboard());
    _currentPage = HomePage();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: _currentPage,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), title: Text('Recipes')),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), title: Text('Dashboard')),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.yellow[800],
          onTap: (selectedIndex) => _changePage(selectedIndex),
        ));
  }
}
