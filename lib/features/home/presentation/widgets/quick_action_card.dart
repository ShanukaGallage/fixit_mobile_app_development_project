import 'package:flutter/material.dart';

class QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isPrimary;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Material(
      color: isPrimary ? colorScheme.primary : colorScheme.surfaceVariant.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 32,
                color: isPrimary ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isPrimary ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
