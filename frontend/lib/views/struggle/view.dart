part of 'controller.dart';

class StruggleView extends StatelessView<StruggleScreen, StruggleController> {
  const StruggleView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: [20].pad,
        child: Column(
          children: [
            30.verticalSpace,
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What are you struggling with',
                style: TextStyle(
                  color: AppColor.grey800,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            24.verticalSpace,
            Wrap(
              runSpacing: 8.w,
              spacing: 10.w,
              runAlignment: WrapAlignment.center,
              children: controller.struggles
                  .map((e) => InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: () {
                          e.isStruggling = !e.isStruggling;
                          controller.rebuild();
                        },
                        child: Container(
                          width: (MediaQuery.sizeOf(context).width / 3.5),
                          padding: [16, 16].pad,
                          decoration: ShapeDecoration(
                            color: e.isStruggling
                                ? AppColor.brandColor
                                : AppColor.gray50,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            e.text.replaceAll(' ', '\n'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: e.isStruggling
                                  ? AppColor.white
                                  : AppColor.gray600,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            24.verticalSpace,
            Padding(
              padding: [25].pad,
              child: Text(
                "Tell us about your struggle so we can connect you with people like you",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.gray500,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            LoadingButton(
              buttonState: controller.buttonState,
              child: AppButton(
                onTap: controller.finishSetup,
                width: double.maxFinite,
                text: 'Continue',
              ),
            ),
            8.verticalSpace,
            TextButton(
              onPressed: () => context.goNamed(MainScreen.name),
              child: const Text(
                'Skip for now',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.brandColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
