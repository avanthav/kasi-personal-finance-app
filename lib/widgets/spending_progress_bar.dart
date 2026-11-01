import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SpendingProgressBar extends StatelessWidget {
  final double percentage; // e.g., 0.36 for 36%

  const SpendingProgressBar({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final clampedPercent = percentage.clamp(0.0, 1.0);
    final percentInt = (clampedPercent * 100).toInt();

    return Row(
      children: [
        // Bar track
        Expanded(
          child: Container(
            height: 12,
            decoration: BoxDecoration(
              color: AppColors.progressBackground,
              borderRadius: BorderRadius.circular(6),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final barWidth = constraints.maxWidth * clampedPercent;
                return Stack(
                  children: [
                    Container(
                      width: barWidth,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Percent label
        Text(
          '$percentInt% used',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

