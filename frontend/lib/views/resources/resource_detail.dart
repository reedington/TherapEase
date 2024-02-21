part of 'controller.dart';

class ResourceRedetail extends StatefulWidget {
  final int id;
  const ResourceRedetail({
    super.key,
    required this.id,
  });

  @override
  State<ResourceRedetail> createState() => _ResourceRedetailState();
}

class _ResourceRedetailState extends State<ResourceRedetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resources",
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColor.white800,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: [20, 20, 20, 0].pad,
        children: [
          Hero(
            tag: widget.id,
            child: Container(
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImages.face,
                  ),
                ),
              ),
            ),
          ),
          24.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: ColoredBackgroundText(
              textColor: AppColor.brandColor,
              backgroundColor: AppColor.success50,
              text: 'Mental Health Basics',
              fontSize: 12.sp,
            ),
          ),
          6.verticalSpace,
          Text(
            "Types of addiction, their impact, and common signs.",
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColor.gray800,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Mental wellness blog",
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColor.gray400,
              fontWeight: FontWeight.w500,
            ),
          ),
          24.verticalSpace,
          for (int i = 0; i <= 4; i++) ...[
            Text(
              """
Addiction is a complex and pervasive challenge that can affect individuals from all walks of life. Recognizing the types of addiction, understanding their impact, and identifying common signs are crucial steps in fostering awareness and support.
""",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.gray500,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Types of Addiction:",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.gray500,
                fontWeight: FontWeight.w600,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
