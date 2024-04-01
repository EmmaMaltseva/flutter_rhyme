import 'package:flutter/material.dart';
import 'package:flutter_project/features/favorites/favorites.dart';
import 'package:flutter_project/features/poems/poems.dart';
import 'package:flutter_project/features/search/search.dart';
import 'package:flutter_project/features/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//основной виджет
class _HomeScreenState extends State<HomeScreen> {

  var _selectedPageIndex = 0;
  final _pageController = PageController(); //для переключения между страницами

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) { //для обновления занчения _selectedPageIndex при скролле-переключении экранов
          setState(() => _selectedPageIndex = value);
        },
        children: [
          SearchScreen(), //external widget основой экран поиска
          FavoritesScreen(),
          PoemsScreen(),
          SettingsScreen()
        ],
      ), 
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.hintColor,
        currentIndex: _selectedPageIndex,
        onTap: _openPage, //функция на изменение значения currentIndex
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Избранное'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Стихи'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
        ],
      ),
    );
  }

  void _openPage(int index) {
    setState(() => _selectedPageIndex = index); //меняем переменную 
    _pageController.animateToPage(
      index, 
      duration: Duration(microseconds: 300),
      curve: Curves.linear
    ); //или обычный метод jumpToPage(index)
  }
}




