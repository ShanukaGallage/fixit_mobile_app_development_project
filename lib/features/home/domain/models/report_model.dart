class ReportModel {
  final String id;
  final String title;
  final String description;
  final String status; // e.g., 'Reported', 'Under Review', 'Resolved'
  final String locationName;
  final String category; // e.g., 'Road', 'Streetlight', 'Waste'
  final double distance; // in meters
  final String severity; // e.g., 'Low', 'Medium', 'High'
  final String? imageUrl;
  final int upvotes;
  final DateTime reportedAt;

  const ReportModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.locationName,
    required this.category,
    required this.distance,
    required this.severity,
    this.imageUrl,
    required this.upvotes,
    required this.reportedAt,
  });
}
