part of 'controller.dart';

class OnboardingView
    extends StatelessView<OnboardingScreen, OnboardingController> {
  const OnboardingView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.onboarding,
            ),
          ),
        ),
        child: ValueListenableBuilder(
            valueListenable: controller.index,
            builder: (context, index, _) {
              return Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: controller.pageController,
                      onPageChanged: (value) => controller.index.value = value,
                      children: [
                        for (var i in controller.display)
                          Padding(
                            padding: [45].pad,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  i.text,
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                16.verticalSpace,
                                Text(
                                  i.desciption,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                40.verticalSpace,
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  AppButton(
                    text: switch (index) {
                      0 => 'Continue',
                      1 => 'Continue',
                      _ => 'Get Started',
                    },
                    backgroudColor: AppColor.brandColor,
                    onTap: () => switch (index) {
                      0 => controller.pageController.animateToPage(1,
                          duration: 500.ms, curve: Curves.linear),
                      1 => controller.pageController.animateToPage(2,
                          duration: 500.ms, curve: Curves.linear),
                      _ => context.goNamed(SignupScreen.name),
                    },
                    borderRadius: 48.r,
                    textStyle: const TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  60.verticalSpace,
                ],
              );
            }),
      ),
    );
  }
}
