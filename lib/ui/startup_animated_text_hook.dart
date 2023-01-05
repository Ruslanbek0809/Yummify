import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'startup_viewmodel.dart';

class StartUpAnimatedTextHook extends HookViewModelWidget<StartUpViewModel> {
  final Widget child;
  final int? delay;
  const StartUpAnimatedTextHook(
      {required this.child, required this.delay, Key? key})
      : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, StartUpViewModel model) {
    final _animController =
        useAnimationController(duration: Duration(seconds: 1));
    Animation<double> _fadeInFadeOut;
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(_animController);

    /// Animation will be PLAYED only for the first time
    if (model.startAnimation == true)
      Timer(Duration(milliseconds: delay!), () {
        model.log.v('_animController CALLED');
        _animController.forward();
      });

    return FadeTransition(
      child: child,
      opacity: _fadeInFadeOut,
    );
  }
}
