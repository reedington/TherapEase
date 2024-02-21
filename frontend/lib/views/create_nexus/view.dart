part of 'controller.dart';

class CreateNexusView
    extends StatelessView<CreateNexusScreen, CreateNexusController> {
  const CreateNexusView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recovery Nexus",
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColor.white800,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: [20].pad,
        children: [
          const CustomTextInput(
            hintText: 'Enter Nexus name',
          ),
          16.verticalSpace,
          const CustomTextInput(
            hintText: 'Add description (Optional)',
          ),
          16.verticalSpace,
          ListTile(
            title: Text(
              "Add Co-Host",
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColor.gray700,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: SvgPicture.asset(
              AppSvg.chevronRight,
            ),
          ),
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            title: Text(
              "Record Nexus",
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColor.gray700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 350.h,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {},
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: AppButton(text: 'Start now'),
              ),
              20.horizontalSpace,
              AppButton(
                width: 50.w,
                icon: SvgPicture.asset(
                  AppSvg.calendar,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
