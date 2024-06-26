import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/search/widgets/widgets.dart';
import 'package:flutter_project/ui/ui.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Rhymer'),
          surfaceTintColor: Colors.transparent,
          pinned: true,
          snap: true,
          floating: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SearchButton(
              onTap: () {
                _showSearchBottonSheet(context);
              },
            ), //extract widget строки поиска
          ),
        ),
        const SliverToBoxAdapter(
            child:
                SizedBox(height: 16)), //расстояние между апбаром и сливерлистом
        SliverToBoxAdapter(
            child: SizedBox(
          height: 100,
          child: ListView.separated(
            //помимо ListView.builder есть ListView.separated. он позволяет добавить разделители с помощью separatorBuilder
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            separatorBuilder: (context, index) => const SizedBox(
              width: 16,
            ),
            itemBuilder: (context, index) {
              final rhymes = List.generate(
                  4, (index) => 'Рифма $index'); //генерируем список рифм
              return RhymeHistoryCard(rhymes: rhymes);
            }, //передаем рифмы в виджет карточки слова с рифмой(истории)
          ),
        )),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(
            itemBuilder: (context, index) => const RhymeListCard(
                  rhyme: 'Рифма',
                ) //extract widget карточка рифма с лайком
            )
      ],
    );
  }

  Future<dynamic> _showSearchBottonSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled:
          true, //делаем на весь экран (+добавить Column) отдаем отвественность за скрол нашему чайлду и за высоту
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => const Padding(
        padding: EdgeInsets.only(top: 120),
        child: SearchRhymesBottonSheet(),
      ),
    );
  }
}
