part of 'controller.dart';

class SuccessCreation extends StatelessWidget {
  const SuccessCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: [20].pad,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You are in",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: AppColor.gray500,
                  fontWeight: FontWeight.w700,
                ),
              ),
              8.verticalSpace,
              const Text(
                "Welcome to TherapEase",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.grey800,
                  fontWeight: FontWeight.w400,
                ),
              ),
              40.verticalSpace,
              const SvgIcon(
                svg: AppSvg.success,
              ),
              150.verticalSpace,
              AppButton(
                width: double.maxFinite,
                text: 'Let\'s Go',
                onTap: () => context.goNamed(MainScreen.name),
              )
            ],
          ),
        ),
      ),
    );
  }
}
