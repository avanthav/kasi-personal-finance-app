import 'package:flutter/material.dart';

enum TransactionType { income, expense }

class UpcomingPayment {
  final String title;
  final String dueDate;
  final double amount;
  final String merchantType;
  final Color logoBgColor;

  const UpcomingPayment({
    required this.title,
    required this.dueDate,
    required this.amount,
    required this.merchantType,
    required this.logoBgColor,
  });
}

class TransactionItem {
  final String title;
  final String category;
  final String timestamp;
  final double amount;
  final TransactionType type;
  final String merchantType;

  const TransactionItem({
    required this.title,
    required this.category,
    required this.timestamp,
    required this.amount,
    required this.type,
    required this.merchantType,
  });
}

