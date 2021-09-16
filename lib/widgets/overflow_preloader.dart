import 'package:flutter/material.dart';

class OverlayPreloader extends StatelessWidget {
  final Widget child;
  final bool enablePreloader;
  const OverlayPreloader(
      {Key? key, required this.child, this.enablePreloader = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (enablePreloader)
          Container(
            color: Colors.black54.withOpacity(0.4),
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
