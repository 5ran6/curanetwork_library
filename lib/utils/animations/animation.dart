import 'package:curanetwork_library/imports/imports.dart';
import 'dart:math' as math;


Widget rotatingLoader(
    _controller, color
    ) {
  return Center(
    child: AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        width: 50,
        height: 50,
        child: Image.asset(
          'assets/whitelogo.png',
          width: 50.0,
          fit: BoxFit.fitWidth,
          color: color,
        ),
      ),
    ),
  );
}

Widget loader(
    _animation, color
    ) {
  return Center(
    child: ScaleTransition(
      scale: _animation,
      child: Container(
        width: 50,
        height: 50,
        child: Image.asset(
          'assets/whitelogo.png',
          width: 50.0,
          fit: BoxFit.fitWidth,
          color: color,
        ),
      ),
    ),
  );
}
