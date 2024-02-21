part of 'controller.dart';

class CommunityModal {
  static Future<T?> showGuideLineModal<T>(BuildContext context) {
    var terms = [
      "Accept terms to continue:",
      "Empathy and Understanding:",
      "Support, Not Advice:",
      "Mindful Language:",
      "No Promotions or Solicitations:",
      "Respect Boundaries:",
      "Positive and Constructive:",
    ];
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      scrollControlDisabledMaxHeightRatio: 0.75,
      builder: (context) {
        return SingleChildScrollView(
          padding: [20].pad,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Recovery Nexus community Guideline",
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: AppColor.gray800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SvgIcon(
                    svg: AppSvg.xMark,
                    onTap: () => context.popTo(),
                  )
                ],
              ),
              18.verticalSpace,
              Text(
                "Welcome to the Recovery Nexus community—a space for anonymous support, shared experiences, and healing. To maintain a positive and respectful environment, please adhere to the following guidelines:",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColor.gray500,
                  fontWeight: FontWeight.w400,
                ),
              ),
              18.verticalSpace,
              ...terms.map(
                (e) => Text(
                  "${terms.indexOf(e) + 1}. $e\n",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColor.gray900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              24.verticalSpace,
              AppButton(
                text: 'Got It',
                width: double.maxFinite,
                onTap: () => context.popTo(true),
              ),
              (kBottomNavigationBarHeight + 100).verticalSpace,
            ],
          ),
        );
      },
    );
  }

  static Future<T?> startListeningModal<T>(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      scrollControlDisabledMaxHeightRatio: 0.85,
      builder: (context) {
        return SingleChildScrollView(
          padding: [20].pad,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                children: [
                  const SvgIcon(
                    svg: AppSvg.microphone,
                  ),
                  8.horizontalSpace,
                  const SvgIcon(
                    svg: AppSvg.audioWave,
                  ),
                  8.horizontalSpace,
                  AvatarStack(
                    height: 35.h,
                    width: 100.w,
                    avatars: [
                      for (var n = 0; n < 15; n++)
                        const AssetImage(
                          AppImages.face,
                        ),
                    ],
                  ),
                  8.horizontalSpace,
                  Text(
                    "Listening",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.gray400,
                    ),
                  )
                ],
              ),
              20.verticalSpace,
              Wrap(
                runSpacing: 20.h,
                spacing: 8.w,
                children: [
                  for (int i = 0; i <= 10; i++) const CircleAvatarName(),
                ],
              ),
              22.verticalSpace,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your mic will be mute to start with",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.gray900,
                  ),
                ),
              ),
              22.verticalSpace,
              AppButton(
                text: 'Start listening',
                width: double.maxFinite,
                onTap: () => context.popTo(true),
              ),
              (kBottomNavigationBarHeight + 100).verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
