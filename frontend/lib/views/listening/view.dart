part of 'controller.dart';

class ListeningView
    extends StatelessView<ListeningScreen, ListeningController> {
  const ListeningView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recovery Nexus",
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColor.white800,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: [20, 15, 20, 30].pad,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgIcon(
              svg: AppSvg.micOff,
              width: 56.w,
              backgroundColor: AppColor.gray400,
            ),
            SvgIcon(
              svg: AppSvg.micOff,
              width: 56.w,
              backgroundColor: AppColor.gray400,
            ),
            SvgIcon(
              svg: AppSvg.micOff,
              width: 72.w,
              backgroundColor: AppColor.brandColor,
            ),
            SvgIcon(
              svg: AppSvg.micOff,
              width: 56.w,
              backgroundColor: AppColor.gray400,
            ),
            SvgIcon(
              svg: AppSvg.micOff,
              width: 56.w,
              backgroundColor: AppColor.gray400,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: [20].pad,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Types of addiction, their impact, and common signs.",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.gray800,
                  ),
                ),
              ),
              20.horizontalSpace,
              const ColoredBackgroundText(
                backgroundColor: AppColor.error50,
                textColor: AppColor.error100,
                text: 'Live',
              ),
            ],
          ),
          2.verticalSpace,
          Row(
            children: [
              Text(
                "Mental wellness blog",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.gray400,
                ),
              ),
              20.horizontalSpace,
              const ColoredBackgroundText(
                textColor: AppColor.brandColor,
                backgroundColor: AppColor.success50,
                text: 'Host',
              ),
            ],
          ),
          15.verticalSpace,
          Wrap(
            runSpacing: 20.h,
            spacing: 8.w,
            children: [
              for (int i = 1; i <= 16; i++) const CircleAvatarName(),
            ],
          ),
        ],
      ),
    );
  }
}
