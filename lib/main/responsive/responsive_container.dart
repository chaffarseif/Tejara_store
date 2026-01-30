import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable/exports.dart';

@RoutePage()
class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double?>(
          context,
          conditionalValues: [
            const Condition.between(start: 0, end: 350, value: 350),
            const Condition.between(start: 350, end: 450, value: 450),
            const Condition.between(start: 600, end: 1000, value: 600),
            const Condition.between(start: 1000, end: 1400, value: 1000),
            const Condition.between(start: 1400, end: 1900, value: 1400),
            const Condition.between(start: 1900, end: 2400, value: 1900),
            const Condition.largerThan(breakpoint: 2400, value: 2400),
            // There are no conditions for width over 1200
            // because the `maxWidth` is set to 1200 via the MaxWidthBox.
          ],
        ).value,
        child: BouncingScrollWrapper.builder(
          context,
          const KeyboardDismiss(
            closeKeyboardOnTap: true,
            closeKeyboardOnVerticalSwipe: true,
            child: AutoRouter(),
          ),
        ),
      ),
      breakpoints: [const Breakpoint(start: 0, end: 350, name: 'xs')],
    );
  }
}
