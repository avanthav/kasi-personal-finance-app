import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../theme/app_colors.dart';

class UpcomingPaymentCard extends StatelessWidget {
  final UpcomingPayment payment;

  const UpcomingPaymentCard({
    super.key,
    required this.payment,
  });

  String _formatAmount(double amount) {
    final str = amount.toStringAsFixed(0);
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return str.replaceAllMapped(reg, (match) => '${match[1]},');
  }

  Widget _buildMerchantLogo() {
    String? assetPath;
    if (payment.merchantType == 'koko') {
      assetPath = 'assets/images/koko.jpg';
    } else if (payment.merchantType == 'dialog') {
      assetPath = 'assets/images/Dialog.jpg';
    }

    if (assetPath != null) {
      return Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain,
        ),
      );
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: payment.logoBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          payment.title.isNotEmpty ? payment.title[0] : '?',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.borderSubtle,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          _buildMerchantLogo(),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  payment.dueDate,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'LKR ${_formatAmount(payment.amount)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}
