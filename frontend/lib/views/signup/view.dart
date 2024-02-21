part of 'controller.dart';

class SignupView extends StatelessView<SignupScreen, SignupController> {
  const SignupView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: ListView(
        padding: [35].pad,
        children: [
          Image.asset(
            AppImages.logoText,
            width: 150.w,
            height: 150.h,
          ),
          40.verticalSpace,
          Center(
            child: Text(
              "Welcome to TherapEase",
              style: TextStyle(
                color: AppColor.grey800,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          8.verticalSpace,
          Center(
            child: Text(
              "To get started, enter your email",
              style: TextStyle(
                color: AppColor.grey800,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          40.verticalSpace,
          CustomTextInput(
            controller: controller.emailEditingController,
            hintText: 'Enter Email',
          ),
          24.verticalSpace,
          LoadingButton(
            buttonState: controller.buttonState,
            child: AppButton(
              onTap: controller.signUp,
              text: 'Continue',
            ),
          ),
          20.verticalSpace,
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Have an account? ',
                    style: TextStyle(
                      color: AppColor.brandColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign in',
                    style: TextStyle(
                      color: AppColor.brandColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.replaceNamed(
                            LoginScreen.name,
                          ),
                  ),
                ],
              ),
            ),
          ),
          28.verticalSpace,
          const Center(
            child: Text(
              "Or",
              style: TextStyle(
                color: AppColor.grey800,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          16.verticalSpace,
          AppButton(
            onTap: controller.googleSignin,
            text: 'Sign in with Google',
            icon: const SvgIcon(
              svg: AppSvg.google,
            ),
            backgroudColor: AppColor.white,
            borderWidth: 1,
            borderColor: AppColor.gray700,
            textStyle: TextStyle(
              color: AppColor.gray700,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          12.verticalSpace,
          AppButton(
            onTap: () {},
            text: 'Sign in with Facebook',
            icon: const SvgIcon(
              svg: AppSvg.facebook,
            ),
            backgroudColor: AppColor.white,
            borderWidth: 1,
            borderColor: AppColor.gray700,
            textStyle: TextStyle(
              color: AppColor.gray700,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          12.verticalSpace,
          AppButton(
            onTap: () {},
            text: 'Sign in with Apple',
            icon: const SvgIcon(
              svg: AppSvg.apple,
            ),
            backgroudColor: AppColor.white,
            borderWidth: 1,
            borderColor: AppColor.gray700,
            textStyle: TextStyle(
              color: AppColor.gray700,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          12.verticalSpace,
        ],
      ),
    );
  }
}
