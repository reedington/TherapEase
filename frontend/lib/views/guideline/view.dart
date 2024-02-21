part of 'controller.dart';

class GuidelineView
    extends StatelessView<GuidelineScreen, GuidelineController> {
  const GuidelineView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const SvgIcon(
            svg: AppSvg.xMark,
          ),
        ),
      ),
      body: Padding(
        padding: [15].pad,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                20.horizontalSpace,
                AvatarGlow(
                  glowColor: AppColor.warning600,
                  child: const SvgIcon(
                    svg: AppSvg.alertCircle,
                  ),
                ),
                30.horizontalSpace,
                Expanded(
                  child: Text(
                    "Recovery Nexus\ncommunity Guideline",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.gray900,
                    ),
                  ),
                )
              ],
            ),
            20.verticalSpace,
            Text(
              "Welcome to the Recovery Nexus community—a space for anonymous support, shared experiences, and healing.",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.gray500,
                fontWeight: FontWeight.w400,
              ),
            ),
            24.verticalSpace,
            ...controller.terms.map((e) => Text(
                  "${controller.terms.indexOf(e) + 1}. $e\n",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColor.gray500,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            24.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "To proceed, type ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.gray500,
                    ),
                  ),
                  TextSpan(
                    text: "“I AGREE TO THESE GUIDELINES”",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.brandColor,
                    ),
                  ),
                ],
              ),
            ),
            60.verticalSpace,
            const CustomTextInput(),
            16.verticalSpace,
            AppButton(
              text: 'Accept terms to continue',
              width: double.maxFinite,
              onTap: () => context.goNamed(MainScreen.name),
            )
          ],
        ),
      ),
    );
  }
}
