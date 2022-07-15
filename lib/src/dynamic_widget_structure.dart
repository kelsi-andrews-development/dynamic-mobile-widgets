import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Base class for implementing [PlatformBuilder] as a [StatefulWidget].
///
/// ***This class will never be directly called, but it is used in every [PlatformBuilder] class or widget.***
abstract class DynamicStatefulWidget extends StatefulWidget {
  /// Initializes [key] for subclasses.
  const DynamicStatefulWidget({Key? key}) : super(key: key);

  @override
  DynamicState createState();
}

/// Base element for implementing a [StatefulElement] or [StatelessElement] of [PlatformBuilder].
///
/// ***Does not implement the [State] of [PlatformBuilder]***
abstract class DynamicWidget extends DynamicStatefulWidget {
  const DynamicWidget({Key? key}) : super(key: key);
}

/// Base class for implementing a [StatefulElement] or [StatelessElement] for [PlatformBuilder] as a [State].
abstract class DynamicState<T extends DynamicStatefulWidget> extends State<T> {
  /// Helps determine the operating system of this user's device.
  /// * [true] - Device is Android operating system
  /// * [false] - Device is IOS operating system
  final bool platform = Platform.isAndroid;

  @override
  Widget build(BuildContext context);
}

/// Base class for implementing [PlatformBuilder] as a [StatelessWidget].
abstract class DynamicStatelessWidget extends DynamicState<DynamicWidget> {
  @override
  Widget build(BuildContext context);
}
