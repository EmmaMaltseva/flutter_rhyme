import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/base_container.dart';
import '../widgets/widgets.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Темная тема',
              value: false,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Уведомления',
              value: false,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Разрешить аналитику',
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Очистить историю',
              iconData: Icons.delete,
              iconColor: Theme.of(context).primaryColor,
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Поддержка',
              iconData: Icons.message,
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({
    super.key,
    required this.title,
    this.onTap,
    required this.iconData,
    this.iconColor,
  });

  final String title;
  final VoidCallback? onTap; //реакция на нажатие карточки
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      //для реализации логики нажатия
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        child: BaseContainer(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  iconData,
                  color: iconColor ?? theme.hintColor.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
