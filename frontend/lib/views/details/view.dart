part of 'controller.dart';

class DetailsView extends StatelessView<DetailsScreen, DetailsController> {
  const DetailsView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: ValueListenableBuilder(
        valueListenable: controller.detailSection,
        builder: (context, section, _) {
          return ListView(
            padding: [35].pad,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  switch (section) {
                    DetailSection.name => "What is your First and Last Name",
                    DetailSection.username => "What is your preferred username",
                    DetailSection.gender => "What is your Gender",
                    DetailSection.age => "How old are you",
                  },
                  style: const TextStyle(
                    color: AppColor.grey800,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              40.verticalSpace,
              if (section == DetailSection.name) ...[
                CustomTextInput(
                  controller: controller.firstNameController,
                  hintText: 'Enter First Name',
                ),
                24.verticalSpace,
                CustomTextInput(
                  controller: controller.lastNameController,
                  hintText: 'Enter Last Name',
                ),
              ] else if (section == DetailSection.username)
                CustomTextInput(
                  controller: controller.userNameController,
                  hintText: 'What is your preferred username',
                  inputFormatters: [
                    LowercaseTextFormatter(),
                  ],
                )
              else if (section == DetailSection.gender)
                CustomTextInput(
                  controller: controller.genderController,
                  hintText: 'What is your Gender',
                  readOnly: true,
                  onTap: () async {
                    controller.gender =
                        await DetailsModal.showGenderBottomSheet(context);
                    if (controller.gender != null) {
                      controller.genderController.text =
                          '${controller.gender}'.capitalize();
                    }
                  },
                  suffixIcon: RotatedBox(
                    quarterTurns: 1,
                    child: SvgPicture.asset(
                      AppSvg.chevronRight,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              else if (section == DetailSection.age)
                CustomTextInput(
                  controller: controller.ageController,
                  hintText: 'How old are you',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              24.verticalSpace,
              LoadingButton(
                buttonState: controller.buttonState,
                child: AppButton(
                  onTap: controller.performCall,
                  text: 'Submit',
                ),
              ),
              24.verticalSpace,
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
              24.verticalSpace,
              if ([DetailSection.name, DetailSection.username]
                  .contains(section))
                Center(
                  child: Text(
                    "Your username will be visible but we will hide your name and age",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.brandColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
