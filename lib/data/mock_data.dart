import 'package:flutter/material.dart';
import '../models/transaction.dart';

class MockData {
  static const String userName = 'Chamuditha';
  static const double todaySpending = 6500;
  static const String nextPaymentMerchant = 'Koko Pay';
  static const double nextPaymentAmount = 2800;
  static const String nextPaymentDate = '02 Nov';

  // Monthly Overview
  static const double monthlyIncome = 100000;
  static const double monthlySpent = 36000;
  static const double spentPercentage = 0.36;

  // SMS Tracking
  static const int detectedSmsCount = 3;

  // Upcoming Payments
  static const List<UpcomingPayment> upcomingPayments = [
    UpcomingPayment(
      title: 'Koko Instalment',
      dueDate: '02 Nov 2026',
      amount: 2800,
      merchantType: 'koko',
      logoBgColor: Colors.white,
    ),
    UpcomingPayment(
      title: 'Dialog Bill',
      dueDate: '04 Nov 2026',
      amount: 1500,
      merchantType: 'dialog',
      logoBgColor: Colors.white,
    ),
  ];

  // Recent Transactions
  static const List<TransactionItem> recentTransactions = [
    TransactionItem(
      title: 'Keells Super',
      category: 'Groceries',
      timestamp: 'Today, 10:42 AM',
      amount: 3450,
      type: TransactionType.expense,
      merchantType: 'keells',
    ),
    TransactionItem(
      title: 'PickMe',
      category: 'Transport',
      timestamp: 'Today, 10:42 AM',
      amount: 750,
      type: TransactionType.expense,
      merchantType: 'pickme',
    ),
  ];
}

