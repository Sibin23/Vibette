import 'package:flutter/cupertino.dart';

class WidgetLayout extends StatelessWidget {
  const WidgetLayout(
      {super.key,
      required this.size,
      required this.minwidth,
      required this.tabletwidth,
      required this.desktopwidth,
      required this.tabletCondition,
      required this.widget});
  final Size size;
  final double minwidth;

  final bool tabletCondition;
  final double tabletwidth;
  final double desktopwidth;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        child: Container(
          constraints: BoxConstraints(
              minWidth: minwidth,
              maxWidth: size.width > 1024
                  ? desktopwidth
                  : tabletCondition
                      ? tabletwidth
                      : size.width),
          child: widget,
        ),
      );
    });
  }
}
