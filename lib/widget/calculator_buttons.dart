import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final orientation = MediaQuery.of(context).orientation;
    final bool isPortrait = orientation == Orientation.portrait;

    final theme = Theme.of(context);
    final backgroundColor = color ??
        (isOperator
            ? theme.colorScheme.secondary.withOpacity(0.8)
            : theme.elevatedButtonTheme.style?.backgroundColor?.resolve({}) ??
            Colors.grey[800]);

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: isPortrait? ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onclick,
          child: icon != null
              ? Icon(icon, color: Colors.white, size: 20.sp)
              : Text(
            text ?? '',
            style: TextStyle(fontSize: 18.sp, color: Colors.white),
          ),
        ) :
        SizedBox(
          width:0.1.sw,
          height: 0.13.sh,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: const EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onclick,
            child: icon != null
                ? Icon(icon, color: Colors.white, size: 0.03.sw)
                : Text(
              text ?? '',
              style: TextStyle(fontSize: 0.03.sw, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
