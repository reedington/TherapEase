part of 'controller.dart';

class OtpView extends StatelessView<OtpScreen, OtpController> {
  const OtpView(super.state, {super.key});

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
              "Verification code",
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
              "We have sent OTP to your email",
              style: TextStyle(
                color: AppColor.grey800,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          40.verticalSpace,
          Pinput(
            length: 4,
            controller: controller.passwordController,
            showCursor: true,
          ),
          20.verticalSpace,
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Didn’t receive any code?  ',
                    style: TextStyle(
                      color: AppColor.brandColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Resend Code',
                    style: TextStyle(
                      color: AppColor.brandColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.replaceNamed(
                            SignupScreen.name,
                          ),
                  ),
                ],
              ),
            ),
          ),
          24.verticalSpace,
          LoadingButton(
            buttonState: controller.buttonState,
            child: AppButton(
              onTap: controller.logIn,
              text: 'Verify & Proceed',
            ),
          ),
        ],
      ),
    );
  }
}
