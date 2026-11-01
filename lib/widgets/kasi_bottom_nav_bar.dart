import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../theme/app_colors.dart';

/// A reusable bottom navigation bar component designed for the Kasi app.
///
/// Features:
/// - Floating rounded navbar with 16px corner radius and #2D2D2D background.
/// - Integrated separate + (Add) action button with #E5E5E5 background and #CD9C6C icon.
/// - Configurable [selectedIndex], [onItemSelected], and [onAddPressed].
/// - Optional custom items via [items] if other screens need different tabs.
class KasiBottomNavBar extends StatelessWidget {
  /// The active selected tab index (defaults to 0 for Home).
  final int selectedIndex;

  /// Callback when a navigation item is tapped.
  final ValueChanged<int>? onItemSelected;

  /// Callback when the standalone "+" button is tapped.
  final VoidCallback? onAddPressed;

  /// Optional custom items. Defaults to Home, Insights, History, Explore.
  final List<KasiNavItem>? items;

  const KasiBottomNavBar({
    super.key,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.onAddPressed,
    this.items,
  });

  static const List<KasiNavItem> defaultItems = [
    KasiNavItem(
      icon: HugeIcons.strokeRoundedHome01,
      label: 'Home',
    ),
    KasiNavItem(
      icon: HugeIcons.strokeRoundedPieChart,
      label: 'Insights',
    ),
    KasiNavItem(
      icon: HugeIcons.strokeRoundedBookmark02,
      label: 'History',
    ),
    KasiNavItem(
      icon: HugeIcons.strokeRoundedMoreHorizontal,
      label: 'Explore',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final navItems = items ?? defaultItems;

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 8),
      child: Row(
        children: [
          // Main navigation pill
          Expanded(
            child: Container(
              height: 74,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.navBarBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(navItems.length, (index) {
                  return _buildNavItem(
                    index: index,
                    item: navItems[index],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Separate floating Add button
          GestureDetector(
            onTap: onAddPressed,
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 74,
              height: 74,
              decoration: BoxDecoration(
                color: AppColors.plusButtonBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedAdd01,
                  color: AppColors.accent,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required KasiNavItem item,
  }) {
    final isSelected = selectedIndex == index;
    final color = isSelected ? AppColors.accent : AppColors.navItemUnselected;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onItemSelected?.call(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(
                icon: item.icon,
                color: color,
                size: 25,
              ),
              const SizedBox(height: 4),
              Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Model representing a navigation bar tab item.
class KasiNavItem {
  final dynamic icon;
  final String label;

  const KasiNavItem({
    required this.icon,
    required this.label,
  });
}
