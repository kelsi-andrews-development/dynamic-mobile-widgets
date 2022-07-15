import 'dynamic_widget_structure.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicCircularProgressIndicator extends DynamicStatefulWidget {
  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;
  final bool isAnimating;
  final double radius;

  const DynamicCircularProgressIndicator({
    Key? key,
    this.value,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.strokeWidth = 4.0,
    this.semanticsLabel,
    this.semanticsValue,
    this.isAnimating = true,
    this.radius = 10.0,
  }) : super(key: key);

  @override
  DynamicCircularProgressIndicatorState createState() => DynamicCircularProgressIndicatorState();
}

class DynamicCircularProgressIndicatorState extends DynamicState<DynamicCircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return platform
        ? CircularProgressIndicator(
            key: widget.key,
            value: widget.value,
            backgroundColor: widget.backgroundColor,
            color: widget.color,
            valueColor: widget.valueColor,
            strokeWidth: widget.strokeWidth,
            semanticsLabel: widget.semanticsLabel,
            semanticsValue: widget.semanticsValue,
          )
        : CupertinoActivityIndicator(
            key: widget.key,
            color: widget.color,
            animating: widget.isAnimating,
            radius: widget.radius,
          );
  }
}
