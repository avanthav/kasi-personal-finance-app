import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/daily_spending_card.dart';
import '../widgets/kasi_bottom_nav_bar.dart';
import '../widgets/kasi_header.dart';
import '../widgets/monthly_overview_card.dart';
import '../widgets/recent_transaction_card.dart';
import '../widgets/sms_tracking_card.dart';
import '../widgets/upcoming_payment_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  void _onNotificationPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notifications (No unread alerts)'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onReviewSmsPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening 3 SMS transactions for review...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onAddPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add new transaction'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top App Bar / Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: KasiHeader(
                onNotificationTap: _onNotificationPressed,
              ),
            ),
            const SizedBox(height: 8),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section B: Daily spending summary
                    DailySpendingCard(
                      userName: MockData.userName,
                      spentToday: MockData.todaySpending,
                      nextPaymentMerchant: MockData.nextPaymentMerchant,
                      nextPaymentAmount: MockData.nextPaymentAmount,
                      nextPaymentDate: MockData.nextPaymentDate,
                    ),
                    const SizedBox(height: 8),

                    // Section C: Monthly overview
                    MonthlyOverviewCard(
                      income: MockData.monthlyIncome,
                      spent: MockData.monthlySpent,
                      spentPercentage: MockData.spentPercentage,
                    ),
                    const SizedBox(height: 8),

                    // Section D: Upcoming payments
                    const Text(
                      'Upcoming payments',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...MockData.upcomingPayments.map(
                      (payment) => UpcomingPaymentCard(payment: payment),
                    ),
                    // Section E: Automatic SMS tracking card
                    SmsTrackingCard(
                      transactionCount: MockData.detectedSmsCount,
                      onReviewPressed: _onReviewSmsPressed,
                    ),
                    const SizedBox(height: 8),

                    // Section F: Recent transactions
                    const Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...MockData.recentTransactions.map(
                      (tx) => RecentTransactionCard(transaction: tx),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Section G: Bottom Navigation
      bottomNavigationBar: SafeArea(
        top: false,
        child: KasiBottomNavBar(
          selectedIndex: _currentNavIndex,
          onItemSelected: (index) {
            setState(() {
              _currentNavIndex = index;
            });
          },
          onAddPressed: _onAddPressed,
        ),
      ),
    );
  }
}

