import 'package:flutter/material.dart';
import '../app_theme.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onRecordSmoking;
  final VoidCallback onRecordBuying;

  const ActionButtons({
    super.key,
    required this.onRecordSmoking,
    required this.onRecordBuying,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            label: '记录抽烟',
            icon: Icons.edit_note,
            backgroundColor: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
            textColor: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
            borderColor: isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1),
            onPressed: onRecordSmoking,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _ActionButton(
            label: '记录买烟',
            icon: Icons.shopping_cart,
            backgroundColor: AppTheme.primary,
            textColor: Colors.white,
            isBold: true,
            hasShadow: true,
            onPressed: onRecordBuying,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final bool isBold;
  final bool hasShadow;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.isBold = false,
    this.hasShadow = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 24),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
