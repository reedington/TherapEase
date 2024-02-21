part of 'controller.dart';

class ResourcesView
    extends StatelessView<ResourcesScreen, ResourcesController> {
  const ResourcesView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(
                "Resources",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColor.mainBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 150.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    125.verticalSpace,
                    Center(
                      child: Text(
                        "Empower Your Journey to Mental Health and Recovery with Expertly Curated Resources",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.gray500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView.separated(
          itemCount: 10,
          padding: [20, 0].pad,
          separatorBuilder: (context, index) => 10.verticalSpace,
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(8.r),
              onTap: () => context.pushTo(
                ResourceRedetail(
                  id: index,
                ),
              ),
              child: Container(
                padding: [20, 20].pad,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ColoredBackgroundText(
                            textColor: AppColor.brandColor,
                            backgroundColor: AppColor.success50,
                            text: 'Mental Health Basics',
                          ),
                          Text(
                            "Types of addiction, their impact, and common signs.",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColor.gray800,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Mental wellness blog",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.gray400,
                                ),
                              ),
                              const Text(
                                "• 3 min read • 12 Oct",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.gray,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    10.horizontalSpace,
                    Hero(
                      tag: index,
                      child: Container(
                        height: 100.w,
                        width: 100.w,
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
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
