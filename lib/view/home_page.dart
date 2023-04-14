import 'package:flutter/material.dart';
import 'package:pokemon_library_flutter/view/setting_top/setting_top_page.dart';

import 'home_strings.dart';

final _pageWidgets = [const HomePageBase(), const SettingTopPage()];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  /// タブの高さ
  static const double tabBarHeight = 10;

  static const tabs = [
    _TabWidget(tabTitle: homeTabTitle),
    _TabWidget(tabTitle: settingTabTitle),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pageWidgets.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          fixedColor: Colors.blueAccent,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: homeTabTitle),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: settingTabTitle)
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index);
}

///
/// Homeのページベース
///
class HomePageBase extends StatelessWidget {
  const HomePageBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                height: 100,
                width: 100),
            const Text(
              'pikachu',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// タブの作成
///
class _TabWidget extends StatelessWidget {
  const _TabWidget({Key? key, required this.tabTitle}) : super(key: key);

  /// タブタイトル
  final String tabTitle;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Align(alignment: Alignment.topCenter, child: Text(tabTitle)),
      ),
    );
  }
}
