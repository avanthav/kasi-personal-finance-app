import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DailySpendingCard extends StatelessWidget {
  final String userName;
  final double spentToday;
  final String nextPaymentMerchant;
  final double nextPaymentAmount;
  final String nextPaymentDate;

  const DailySpendingCard({
    super.key,
    required this.userName,
    required this.spentToday,
    required this.nextPaymentMerchant,
    required this.nextPaymentAmount,
    required this.nextPaymentDate,
  });

  @override
  Widget build(BuildContext context) {
    final formattedToday = spentToday.toStringAsFixed(0);
    final formattedNextAmount = nextPaymentAmount.toStringAsFixed(0);

    return Container(
      width: double.infinity,
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.plusButtonBg, // #E5E5E5 from Figma
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Greeting
          Text(
            'Hi $userName',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textDarkPrimary,
            ),
          ),

          // Spending amount & label
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Rs $formattedToday',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                  color: AppColors.textDarkPrimary,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Spent today',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDarkSecondary,
                ),
              ),
            ],
          ),

          // Next payment info row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Next payment',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.accentLight,
                ),
              ),
              Text(
                '$nextPaymentMerchant : LKR $formattedNextAmount on $nextPaymentDate',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDarkPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
