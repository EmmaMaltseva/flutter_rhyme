//виджет строки поиска рифмы
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: double.infinity, //во всю ширину
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: theme.hintColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey[700],
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Поиск рифм...',
              style: TextStyle(
                  fontSize: 16,
                  color: theme.hintColor.withOpacity(0.5),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ));
  }
}
