import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ui/ui.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Избранное'),
          surfaceTintColor: Colors.transparent,
          pinned: true,
          snap: true,
          floating: true,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(
            itemBuilder: (context, index) => const RhymeListCard(
                  isFavorite: true,
                ) //extract widget карточка рифма с лайком
            )
      ],
    );
  }
}
