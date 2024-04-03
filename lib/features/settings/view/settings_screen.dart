import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ui/ui.dart';

import '../widgets/widgets.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Настройки'),
            surfaceTintColor: Colors.transparent,
            pinned: true,
            snap: true,
            floating: true,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Темная тема',
              value: false,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Уведомления',
              value: false,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Разрешить аналитику',
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          const SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BaseContainer(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Очисить историю',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.delete),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
