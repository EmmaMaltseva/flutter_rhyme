//виджет с карточками рифмы и лайка
import 'package:flutter/material.dart';
import 'package:flutter_project/ui/ui.dart';

class RhymeListCard extends StatelessWidget {
  const RhymeListCard(
      {super.key,
      this.isFavorite = false,
      required this.rhyme,
      this.sourseWord}); //может быть и 0

  final String rhyme;
  final String? sourseWord; //может быть и 0
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            if (sourseWord != null) ...[
              Text(sourseWord!, style: theme.textTheme.bodyLarge),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: theme.hintColor.withOpacity(0.4),
                ),
              ),
            ],
            Text(rhyme,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                )),
          ]),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite,
                  color: isFavorite
                      ? theme.primaryColor
                      : theme.hintColor.withOpacity(0.3)))
        ],
      ),
    );
  }
}
