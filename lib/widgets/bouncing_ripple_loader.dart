import 'package:cargic_user/utils/circle_painter.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class BouncingRippleLoader extends StatefulWidget {
  const BouncingRippleLoader({
    Key key,
    this.size = 100.0,
    this.color = CargicColors.fearYellow,
    this.onPressed,
    this.child,
  }) : super(key: key);
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;
  @override
  _BouncingRippleLoaderState createState() => _BouncingRippleLoaderState();
}

class _BouncingRippleLoaderState extends State<BouncingRippleLoader>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                widget.color,
                Color.lerp(widget.color, Colors.black, .05)
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.speaker_phone,
                  size: 44,
                  color: CargicColors.plainWhite,
                ),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: CirclePainter(
          _controller,
          color: widget.color,
        ),
        child: SizedBox(
          width: widget.size * 4.125,
          height: widget.size * 4.125,
          child: _button(),
        ),
      ),
    );
  }
}
