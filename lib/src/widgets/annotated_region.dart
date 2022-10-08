import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAnnotatedRegion extends StatelessWidget {
  const CustomAnnotatedRegion(
      {Key? key,
      required this.child,
      this.systemUiOverlayStyle = SystemUiOverlayStyle.dark})
      : super(key: key);
  final Widget child;
  final SystemUiOverlayStyle systemUiOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: child,
      value: systemUiOverlayStyle,
    );
  }
}
