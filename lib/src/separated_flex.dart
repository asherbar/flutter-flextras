import 'package:flutter/material.dart';

class SeparatedFlex extends StatelessWidget {
  const SeparatedFlex({
    Key? key,
    required this.children,
    required this.direction,
    this.separatorIndexedBuilder,
    this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline = TextBaseline.alphabetic,
    this.textDirection = TextDirection.ltr,
    this.padding = EdgeInsets.zero,
  }) : super(key: key) {
   assert(this.separatorIndexedBuilder != null || this.separatorBuilder != null, 'At least one of separatorIndexedBuilder or separatorBuilder must be set');
  }

  final Axis direction;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline textBaseline;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final EdgeInsets padding;

  /// Return a widget, to be used in between each child widget
  @Deprecated('use [separatorIndexedBuilder] instead')
  final Widget Function()? separatorBuilder;
  
  /// Return a widget, to be used in between each child widget.
  /// i is index of the widget immediently before this separator.
  final Widget Function(int i)? separatorIndexedBuilder;

  @override
  Widget build(BuildContext context) {
    List<Widget> c = List.of(children);
    for (var i = c.length; i-- > 0;) {
      if (i > 0) {
        if (separatorBuilder != null) {
          c.insert(i, separatorBuilder());
        }
        else if (separatorIndexedBuilder != null) {
          c.insert(i, separatorIndexedBuilder(i));
        }
      }
    }
    Widget row = Flex(
      children: c,
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
    );
    return Padding(padding: padding, child: row);
  }
}

/// Allows you to inject a widget between each item in the row
class SeparatedRow extends StatelessWidget {
  const SeparatedRow({
    Key? key,
    required this.children,
    this.separatorIndexedBuilder,
    this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline = TextBaseline.alphabetic,
    this.textDirection = TextDirection.ltr,
    this.padding = EdgeInsets.zero,
  }) : super(key: key) {
   assert(this.separatorIndexedBuilder != null || this.separatorBuilder != null, 'At least one of separatorIndexedBuilder or separatorBuilder must be set');
  }

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline textBaseline;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final EdgeInsets padding;

  /// Return a widget, to be used in between each child widget
  @Deprecated('use [separatorIndexedBuilder] instead')
  final Widget Function()? separatorBuilder;
  
  /// Return a widget, to be used in between each child widget.
  /// i is index of the widget immediently before this separator.
  final Widget Function(int i)? separatorIndexedBuilder;

  @override
  Widget build(BuildContext context) => SeparatedFlex(
        separatorIndexedBuilder: separatorIndexedBuilder,
        separatorBuilder: separatorBuilder,
        children: children,
        direction: Axis.horizontal,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        textBaseline: textBaseline,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        padding: padding,
      );
}

/// Allows you to inject a widget between each item in the column
class SeparatedColumn extends StatelessWidget {
  final List<Widget> children;
  /// Return a widget, to be used in between each child widget
  @Deprecated('use [separatorIndexedBuilder] instead')
  final Widget Function()? separatorBuilder;
  
  /// Return a widget, to be used in between each child widget.
  /// i is index of the widget immediently before this separator.
  final Widget Function(int i)? separatorIndexedBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline textBaseline;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final EdgeInsets padding;

  const SeparatedColumn({
    Key? key,
    required this.children,
    this.separatorIndexedBuilder,
    this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline = TextBaseline.alphabetic,
    this.textDirection = TextDirection.ltr,
    this.padding = EdgeInsets.zero,
  }) : super(key: key) {
   assert(this.separatorIndexedBuilder != null || this.separatorBuilder != null, 'At least one of separatorIndexedBuilder or separatorBuilder must be set');
  }

  @override
  Widget build(BuildContext context) => SeparatedFlex(
        separatorIndexedBuilder: separatorIndexedBuilder,
        separatorBuilder: separatorBuilder,
        children: children,
        direction: Axis.vertical,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        textBaseline: textBaseline,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        padding: padding,
      );
}
