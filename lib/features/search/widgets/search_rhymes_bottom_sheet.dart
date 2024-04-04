import 'package:flutter/material.dart';
import 'package:flutter_project/ui/ui.dart';

class SearchRhymesBottonSheet extends StatelessWidget {
  const SearchRhymesBottonSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseBottomSheet(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: theme.hintColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Начни вводить слово...',
                        hintStyle:
                            TextStyle(color: theme.hintColor.withOpacity(0.5)),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        //стиль, когда инпут активен
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                )),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                        title: const Text('Слово из автокоплита'),
                        onTap: () {},
                      ),
                  separatorBuilder: (context, _) => const Divider(
                        height: 1,
                      ),
                  itemCount: 15))
        ],
      ),
    );
  }
}
