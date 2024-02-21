part of 'controller.dart';

class PasswordView extends StatelessView<PasswordScreen, PasswordController> {
  const PasswordView(super.state, {super.key});

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
              "Enter Password",
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
              "what would you like your password to be",
              style: TextStyle(
                color: AppColor.grey800,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          40.verticalSpace,
          ValueListenableBuilder(
            valueListenable: controller.showPassword,
            builder: (context, showPassword, _) {
              return CustomTextInput(
                controller: controller.passwordController,
                hintText: 'Enter Password',
                obscureText: showPassword,
                suffixIcon: InkWell(
                  onTap: () => controller.showPassword.value = !showPassword,
                  child: SvgPicture.asset(
                    showPassword ? AppSvg.eye : AppSvg.eyeClose,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              );
            },
          ),
          24.verticalSpace,
          ValueListenableBuilder(
            valueListenable: controller.showConfirm,
            builder: (context, showPassword, _) {
              return CustomTextInput(
                controller: controller.confirmController,
                hintText: 'Confirm Password',
                obscureText: showPassword,
                suffixIcon: InkWell(
                  onTap: () => controller.showConfirm.value = !showPassword,
                  child: SvgPicture.asset(
                    showPassword ? AppSvg.eye : AppSvg.eyeClose,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              );
            },
          ),
          24.verticalSpace,
          LoadingButton(
            buttonState: controller.buttonState,
            child: AppButton(
              onTap: controller.submitPassword,
              text: 'Submit',
            ),
          ),
          20.verticalSpace,
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By tapping submit, i accept therapEase’s ',
                    style: TextStyle(
                      color: AppColor.brandColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Term of use',
                    style: TextStyle(
                      color: AppColor.brandColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
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
        ],
      ),
    );
  }
}
