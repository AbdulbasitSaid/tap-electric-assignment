import 'package:flutter/widgets.dart';

class DecoratedCard extends StatelessWidget {
  const DecoratedCard({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.padding = 16,
  });

  final Widget child;
  final double borderRadius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(252, 252, 252, 1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
