import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({
    Key? key,
    required this.space,
  }) : super(key: key);

  final double space;

  @override
  Widget build(BuildContext context) => SizedBox(height: space);
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({
    Key? key,
    required this.space,
  }) : super(key: key);

  final double space;

  @override
  Widget build(BuildContext context) => SizedBox(width: space);
}
