///
/// @desc ''
/// @author karl_wei
/// @date 2022/5/31 10:18
///
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.title,
      this.enabled = false,
      this.width,
      this.height,
      this.onTap,
      this.style,
      this.disableStyle,
      this.decoration,
      this.highlightColor,
      this.disableDecoration})
      : super(key: key);

  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final String title;
  final bool enabled;

  final Color? highlightColor;

  // 字体样式：normal & disable
  final TextStyle? style;
  final TextStyle? disableStyle;

  // 修饰器：normal & disable
  final BoxDecoration? decoration;
  final BoxDecoration? disableDecoration;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(24.w)),
      color: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Ink(
        width: width ?? 296.w,
        height: height ?? 64.h,
        decoration: enabled
            ? decoration ??
                BoxDecoration(
                  color: const Color(0xFF038DFF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(34.h),
                  ),
                )
            : disableDecoration ??
                BoxDecoration(
                  color: const Color(0x80038DFF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(34.h),
                  ),
                ),
        child: InkWell(
          onTap: enabled ? onTap : null,
          highlightColor: highlightColor ?? const Color(0xFF1C7FD1),
          splashColor: highlightColor ?? const Color(0xFF1C7FD1),
          borderRadius: BorderRadius.all(Radius.circular(34.h)),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: enabled
                  ? (style ??
                      Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: Theme.of(context).primaryColor))
                  : disableStyle ??
                      Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
