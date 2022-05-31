import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/asset_name.dart';

///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/31 14:47
///
class CheckingAnimation extends StatefulWidget {
  const CheckingAnimation({Key? key}) : super(key: key);

  @override
  State<CheckingAnimation> createState() => _CheckingAnimationState();
}

class _CheckingAnimationState extends State<CheckingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        AssetNames.imgLoading,
        width: 104.w,
        height: 104.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
