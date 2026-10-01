import 'package:flutter/material.dart';

class MapPreviewCard extends StatelessWidget {
  final VoidCallback onViewMapTap;

  const MapPreviewCard({super.key, required this.onViewMapTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.grey, size: 18),
              const SizedBox(width: 8),
              Text(
                'Near you',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onViewMapTap,
              child: SizedBox(
                height: 160,
                width: double.infinity,
                child: Stack(
                  children: [
                    // Mock Map Background Pattern
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _GridPatternPainter(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                        ),
                      ),
                    ),
                    // Mock Markers
                    const Positioned(
                      top: 30,
                      left: 50,
                      child: Icon(Icons.location_pin, color: Colors.orange, size: 24),
                    ),
                    const Positioned(
                      top: 80,
                      right: 60,
                      child: Icon(Icons.location_pin, color: Colors.red, size: 28),
                    ),
                    const Positioned(
                      bottom: 40,
                      left: 120,
                      child: Icon(Icons.location_pin, color: Colors.blue, size: 24),
                    ),
                    // Current Location Indicator
                    Positioned(
                      top: 70,
                      left: 140,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Map Overlay Actions
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View map',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '12 issues nearby',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPatternPainter extends CustomPainter {
  final Color color;

  _GridPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const double spacing = 20.0;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
