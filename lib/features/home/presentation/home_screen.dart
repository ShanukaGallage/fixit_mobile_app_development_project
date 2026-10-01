import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../domain/models/report_model.dart';
import 'widgets/community_stats.dart';
import 'widgets/home_header.dart';
import 'widgets/map_preview_card.dart';
import 'widgets/nearby_issue_card.dart';
import 'widgets/quick_action_card.dart';

// Realistic mock data based on prompt requirements
final mockNearbyReportsProvider = Provider<List<ReportModel>>((ref) {
  return [
    ReportModel(
      id: '1',
      title: 'Pothole on Main Road',
      description: 'Large pothole causing issues.',
      status: 'Reported',
      locationName: 'Main Road',
      category: 'Road',
      distance: 320,
      severity: 'High',
      upvotes: 24,
      reportedAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    ReportModel(
      id: '2',
      title: 'Broken Streetlight',
      description: 'Light out at intersection.',
      status: 'Under Review',
      locationName: '4th & Elm',
      category: 'Streetlight',
      distance: 540,
      severity: 'Medium',
      upvotes: 12,
      reportedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ReportModel(
      id: '3',
      title: 'Overflowing Garbage Bin',
      description: 'Trash spilling onto the sidewalk.',
      status: 'Reported',
      locationName: 'City Park Entrance',
      category: 'Waste',
      distance: 780,
      severity: 'Low',
      upvotes: 45,
      reportedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nearbyReports = ref.watch(mockNearbyReportsProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HomeHeader(
                userName: 'Shanuka',
                onNotificationTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notifications clicked')),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: MapPreviewCard(
                onViewMapTap: () {
                  context.go('/map');
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: QuickActionCard(
                        title: 'Report an Issue',
                        icon: Icons.add_circle_outline,
                        isPrimary: true,
                        onTap: () {
                          context.push('/report');
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: QuickActionCard(
                        title: 'Explore Nearby',
                        icon: Icons.map_outlined,
                        onTap: () {
                          context.go('/map');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Community Stats',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            const SliverToBoxAdapter(
              child: CommunityStats(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Issues',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final report = nearbyReports[index];
                    return NearbyIssueCard(
                      report: report,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Tapped on ${report.title}')),
                        );
                      },
                    );
                  },
                  childCount: nearbyReports.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
          ],
        ),
      ),
    );
  }
}
