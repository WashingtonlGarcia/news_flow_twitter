import "package:flutter/material.dart";
import "package:loading_animations/loading_animations.dart";

class CenterIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingBouncingLine.square(
        borderColor: Theme.of(context).accentColor.withOpacity(0.8),
        borderSize: 3.0,
        size: 30.0,
        backgroundColor: Theme.of(context).accentColor,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
