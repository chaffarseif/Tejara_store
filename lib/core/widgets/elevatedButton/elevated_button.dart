import 'package:flutter/material.dart';
import 'package:tejara_store/core/widgets/tejara_helpers/Tejara_helpers.dart';

class TejaraElevatedButton extends StatelessWidget {
  const TejaraElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
  });

  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TejaraHelpers.getScreenWidth(context),
      child: ElevatedButton(onPressed: onPressed, child: child, style: style),
    );
  }
}
