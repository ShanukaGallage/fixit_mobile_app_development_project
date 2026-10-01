import 'package:flutter/material.dart';
import '../../domain/models/report_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ReportCard extends StatelessWidget {
  final ReportModel report;

  const ReportCard({super.key, required this.report});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'reported':
        return Colors.orange;
      case 'in progress':
        return Colors.blue;
      case 'resolved':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder - using a solid color container if network image isn't available
          // In a real app, you would use CachedNetworkImage here.
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.grey[300],
            child: Stack(
              fit: StackFit.expand,
              children: [
                // We use an Icon as a placeholder since we don't have real network access setup to guarantee image loads
                const Icon(Icons.image, size: 60, color: Colors.grey),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(report.status),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      report.status,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      report.category,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.thumb_up_outlined, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          '${report.upvotes}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  report.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        report.locationName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
