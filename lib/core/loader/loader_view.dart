import 'package:flutter/material.dart';

class LoaderView extends StatelessWidget {
  const LoaderView(
      {required this.isLoading,
      required this.child,
      this.loaderWidget,
      super.key});

  final bool isLoading;
  final Widget child;
  final Widget? loaderWidget;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loaderWidget?? const Center(
            child: CircularProgressIndicator(),
          )
        : child;
  }
}