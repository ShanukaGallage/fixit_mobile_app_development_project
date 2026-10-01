import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final VoidCallback onNotificationTap;

  const HomeHeader({
    super.key,
    required this.userName,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $userName 👋',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Let's make our community better.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: onNotificationTap,
              ),
              const SizedBox(width: 8),
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
