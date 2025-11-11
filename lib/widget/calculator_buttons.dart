import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color? color;
  final bool isOperator;
  final int flex;
  final VoidCallback onclick;

  const CalcButton({
    super.key,
    required this.onclick,
    this.text,
    this.icon,
    this.color,
    this.isOperator = false,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor = color ??
        (isOperator
            ? theme.colorScheme.secondary.withOpacity(0.8)
            : theme.elevatedButtonTheme.style?.backgroundColor?.resolve({}) ??
            Colors.grey[800]);

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.all(25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onclick,
          child: icon != null
              ? Icon(icon, color: Colors.white, size: 36)
              : Text(
            text ?? '',
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
