
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Rhymer'),
          surfaceTintColor: Colors.transparent,
          pinned: true,
          snap: true,
          floating: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: SearchButton(), //extract widget строки поиска
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)), //расстояние между апбаром и сливерлистом
        SliverToBoxAdapter(
          child: 
          SizedBox(
            height: 100,
            child: ListView.separated(  //помимо ListView.builder есть ListView.separated. он позволяет добавить разделители с помощью separatorBuilder
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(width: 16,),
              itemBuilder: (context, index) {
                final rhymes = List.generate(4, (index) => 'Рифма $index'); //генерируем список рифм
                return RhymeHistoryCard(rhymes: rhymes);}, //передаем рифмы в виджет карточки слова с рифмой(истории)
            ),
          )
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(
          itemBuilder: (context, index) => const RhymeListCard() //extract widget карточка рифма с лайком
        ) 
      ],
    );
  }
}

//виджет с карточками историй рифм
class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
    required this.rhymes,
  });

  final List<String> rhymes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      width: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Слово', style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),),
          Wrap(
            children: rhymes.map((e) => Padding( //вся конструкция мап с ту лист для добавления  padding между рифмами
              padding: EdgeInsets.only(right: 4),
              child: Text(e),
              ))
              .toList(),
          )
        ],
      ),
    );
  }
}

//контенер для стилизации карточки истории рифмы и карточки рифмы с лайком
class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key, 
    required this.child, 
    required this.width, 
    this.margin, //если свойство не нужно везде задавать
    this.padding = const EdgeInsets.only(left: 12),
  });

  final double width;
  final Widget child;
  final EdgeInsets? margin; //если свойство не нужно везде задавать
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: child,);
  }
}

//виджет с карточками рифмы и лайка
class RhymeListCard extends StatelessWidget {
  const RhymeListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      margin: EdgeInsets.symmetric(horizontal: 16)
        .copyWith(bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Рифма', 
            style: theme.textTheme.bodyMedium
          ),
          IconButton(onPressed: () {}, icon: Icon(
            Icons.favorite,
            color: theme.hintColor.withOpacity(0.3)
          ))
        ],
      ),
    );
  }
}

//виджет строки поиска рифмы
class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity, //во всю ширину
      margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.hintColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[700],),
          SizedBox(width: 8,),
          Text(
            'Поиск рифм...', 
            style: TextStyle(
              fontSize: 16,
              color: theme.hintColor.withOpacity(0.5),
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      )
    );
  }
}