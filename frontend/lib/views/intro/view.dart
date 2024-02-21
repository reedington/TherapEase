part of 'controller.dart';

class IntroView extends StatelessView<IntroScreen, IntroController> {
  const IntroView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.goNamed(LoginScreen.name),
          icon: const SvgIcon(
            svg: AppSvg.xMark,
          ),
        ),
      ),
      body: Padding(
        padding: [35].pad,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                height: constraints.maxWidth * 0.85,
                width: constraints.maxWidth * 0.85,
                child: const Stack(
                  children: [
                    CircleImage(
                      alignment: Alignment.centerRight,
                      radius: 28,
                      position: 1,
                    ),
                    CircleImage(
                      alignment: Alignment.centerLeft,
                      radius: 28,
                      position: 4,
                    ),
                    CircleImage(
                      alignment: Alignment(-0.65, -1),
                      radius: 28,
                      position: 5,
                    ),
                    CircleImage(
                      alignment: Alignment(-0.65, 1),
                      radius: 28,
                      position: 3,
                    ),
                    CircleImage(
                      alignment: Alignment(0.65, -1),
                      radius: 28,
                      position: 6,
                    ),
                    CircleImage(
                      alignment: Alignment(0.65, 1),
                      radius: 28,
                      position: 2,
                    ),
                    CircleImage(
                      alignment: Alignment.center,
                      radius: 65,
                    ),
                  ],
                ),
              );
            }),
            40.verticalSpace,
            ...[
              const Center(
                child: Text(
                  "Recovery Nexus",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: AppColor.gray800,
                  ),
                ),
              ),
              16.verticalSpace,
              Center(
                child: Text(
                  "A Safe Haven for Shared Experiences, Support, and Healing",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.gray500,
                  ),
                ),
              ),
              40.verticalSpace,
              AppButton(
                text: 'Continue',
                width: double.maxFinite,
                onTap: () => context.pushNamed(GuidelineScreen.name),
              ),
            ]
                .animate(
                  interval: 100.milliseconds,
                  delay: 2.seconds,
                )
                .fadeIn(
                  duration: 3.seconds,
                )
                .moveY(
                  duration: 3.seconds,
                )
          ],
        ),
      ),
    );
  }
}
