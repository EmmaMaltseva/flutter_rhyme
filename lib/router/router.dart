import 'package:auto_route/auto_route.dart';
import 'package:flutter_project/features/favorites/favorites.dart';
import 'package:flutter_project/features/home/home.dart';
import 'package:flutter_project/features/poems/poems.dart';
import 'package:flutter_project/features/search/search.dart';
import 'package:flutter_project/features/settings/settings.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [  
    AutoRoute(
      page: HomeRoute.page, 
      path: '/',
      children: [
        AutoRoute(
          page: SearchRoute.page, 
          path: 'search',
        ),
        AutoRoute(
          page: FavoritesRoute.page, 
          path: 'favorites'
        ),
        AutoRoute(
          page: PoemsRoute.page, 
          path: 'poems'
        ),
        AutoRoute(
          page: SettingsRoute.page, 
          path: 'settings'
        ),
      ],
    ),
  ];
}