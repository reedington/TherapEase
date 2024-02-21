import 'package:therapease/utils/utils.dart';

class ColoredBackgroundText extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double? fontSize;
  const ColoredBackgroundText({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: [10, 8].pad,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 8.sp,
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class CircleAvatarName extends StatelessWidget {
  const CircleAvatarName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 90.r,
          width: 90.r,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AppImages.face,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(1, 1),
                child: SvgIcon(
                  width: 25.r,
                  backgroundColor: AppColor.brandColor,
                  svg: AppSvg.micOff,
                ),
              )
            ],
          ),
        ),
        Text(
          "Alexa99",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.gray600,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "Host",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.gray400,
          ),
        ),
      ],
    );
  }
}
