import 'package:flutter/material.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key});

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Color?>? _coloranimation;
  Animation<double?>? _sizeAnimation;
  bool isFav = false;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    _coloranimation = ColorTween(begin: Colors.grey.shade300, end: Colors.red)
        .animate(_controller!);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 30),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 30),
    ]).animate(_controller!);

    _controller!.addListener(() {
      print(_controller!.value);
      print(_coloranimation!.value);

      _controller!.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isFav = true;
          });
        }
        if (status == AnimationStatus.dismissed) {
          setState(() {
            isFav = false;
          });
        }
      });
    });
    super.initState();

    // _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller!,
        builder: (context, child) {
          return IconButton(
            onPressed: () {
              isFav ? _controller!.reverse() : _controller!.forward();
            },
            icon: Icon(
              Icons.favorite,
              color: _coloranimation!.value,
              size: _sizeAnimation!.value,
            ),
          );
        });
  }
}
