import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class BgBlurEffect extends StatelessWidget {
  const BgBlurEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        color: Colors.black.withOpacity(0.2),

      ),
    );
  }
}
