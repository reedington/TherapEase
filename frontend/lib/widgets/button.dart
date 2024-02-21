import 'package:therapease/utils/utils.dart';

class SvgIcon extends StatelessWidget {
  final String svg;
  final VoidCallback? onTap;
  final double? width;
  final Color? backgroundColor;
  const SvgIcon({
    super.key,
    required this.svg,
    this.width,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(svg),
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  final ValueNotifier<ButtonState>? buttonState;
  final AppButton child;

  const LoadingButton({
    super.key,
    required this.buttonState,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return buttonState != null
        ? ValueListenableBuilder(
            valueListenable: buttonState!,
            builder: (context, state, _) {
              if (state.isSending) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state.canSend) {
                return AppButton(
                  text: child.text,
                  onTap: child.onTap,
                  width: child.width,
                  textStyle: child.textStyle,
                  iconPad: child.iconPad,
                  borderWidth: child.borderWidth,
                  borderRadius: child.borderRadius,
                  height: child.height,
                  icon: child.icon,
                  backgroudColor: child.backgroudColor,
                  padding: child.padding,
                  borderColor: child.backgroudColor,
                  position: child.position,
                );
              } else {
                return AppButton(
                  text: child.text,
                  width: child.width,
                  textStyle: child.textStyle,
                  iconPad: child.iconPad,
                  borderWidth: child.borderWidth,
                  borderRadius: child.borderRadius,
                  height: child.height,
                  icon: child.icon,
                  backgroudColor: child.backgroudColor,
                  padding: child.padding,
                  borderColor: child.backgroudColor,
                  position: child.position,
                );
              }
            })
        : child;
  }
}

class AppButton extends StatefulWidget {
  final String? text;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final double? iconPad;
  final Widget? icon;
  final TextStyle? textStyle;
  final Color? backgroudColor;
  final Color? borderColor;
  final ButtonIconPosition position;
  final double? borderRadius;
  final double? borderWidth;
  final List<int>? padding;
  const AppButton({
    super.key,
    this.text,
    this.onTap,
    this.width,
    this.textStyle,
    this.iconPad,
    this.borderWidth,
    this.borderRadius,
    this.height,
    this.icon,
    this.backgroudColor,
    this.padding,
    this.borderColor,
    this.position = ButtonIconPosition.left,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  var scale = ValueNotifier(1.0);

  @override
  void dispose() {
    scale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: scale,
        builder: (context, sc, _) {
          return AnimatedScale(
            scale: sc,
            duration: 1.seconds,
            child: ElevatedButton(
              onPressed: widget.onTap == null
                  ? null
                  : () async {
                      scale.value = 0.8;
                      await Future.delayed(50.milliseconds);
                      HapticFeedback.lightImpact();
                      scale.value = 1;
                      await Future.delayed(50.milliseconds);
                      widget.onTap?.call();
                    },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(widget.borderRadius ?? 8.r),
                  side: BorderSide(
                    color: widget.borderColor ?? Colors.transparent,
                    width: widget.borderWidth ?? 2,
                  ),
                ),
                padding: (widget.padding ?? [28, 12]).pad,
                backgroundColor: widget.backgroudColor ?? AppColor.brandColor,
                minimumSize: Size(widget.width ?? 205.w, widget.height ?? 48.h),
                fixedSize: (widget.width != null && widget.height != null)
                    ? Size(widget.width!, widget.height!)
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.text != null &&
                      widget.position == ButtonIconPosition.left &&
                      widget.icon != null) ...[
                    widget.icon!,
                    (widget.iconPad ?? 8).horizontalSpace,
                  ],
                  if (widget.text != null)
                    Text(
                      widget.text!,
                      style: widget.textStyle ??
                          TextStyle(
                            fontSize: 16,
                            color: widget.onTap != null
                                ? AppColor.white
                                : AppColor.gray400,
                            fontWeight: FontWeight.w500,
                          ),
                    )
                  else
                    widget.icon!,
                  if (widget.text != null &&
                      widget.position == ButtonIconPosition.right &&
                      widget.icon != null) ...[
                    (widget.iconPad ?? 8).horizontalSpace,
                    widget.icon!,
                  ],
                ],
              ),
            ),
          );
        });
  }
}
