//виджет с карточками историй рифм
import 'package:flutter/material.dart';
import 'package:flutter_project/ui/ui.dart';

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
          Text(
            'Слово',
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Flexible(
            child: Text(
              rhymes.asMap().entries.map((e) {
                final sb = StringBuffer(); //строить строчки по частям
                sb.write(e.value);
                if (e.key != rhymes.length - 1) {
                  sb.write(', ');
                }
                return sb.toString();
              }).join(),
              overflow: TextOverflow
                  .ellipsis, // если контейнер переполнен,то троеточия
              style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  color: theme.hintColor.withOpacity(0.4)),
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
