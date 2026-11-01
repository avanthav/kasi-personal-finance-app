import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../theme/app_colors.dart';

class RecentTransactionCard extends StatelessWidget {
  final TransactionItem transaction;

  const RecentTransactionCard({
    super.key,
    required this.transaction,
  });

  String _formatAmount(double amount) {
    final str = amount.toStringAsFixed(0);
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return str.replaceAllMapped(reg, (match) => '${match[1]},');
  }

  Widget _buildMerchantIcon() {
    String? assetPath;
    if (transaction.merchantType == 'keells') {
      assetPath = 'assets/images/kelles.png';
    } else if (transaction.merchantType == 'pickme') {
      assetPath = 'assets/images/Pickme.png';
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
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.cardSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          transaction.title.isNotEmpty ? transaction.title[0] : '?',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isExpense = transaction.type == TransactionType.expense;
    final prefix = isExpense ? '- LKR ' : '+ LKR ';
    final amountColor = isExpense ? AppColors.expenseRed : AppColors.incomeGreen;

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
          _buildMerchantIcon(),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${transaction.category}  •  ${transaction.timestamp}',
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
            '$prefix${_formatAmount(transaction.amount)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
