
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double proportion;

  const ChartBar({super.key, required this.proportion});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: FractionallySizedBox(
          heightFactor: proportion,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
            ),
          ),
        ),
        )
    );
  }
}