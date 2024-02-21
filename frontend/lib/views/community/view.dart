part of 'controller.dart';

class CommunityView
    extends StatelessView<CommunityScreen, CommunityController> {
  const CommunityView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 200.h,
          width: MediaQuery.sizeOf(context).width,
          padding: [16].pad,
          color: AppColor.gray,
          child: Column(
            children: [
              25.verticalSpace,
              AppButton(
                text: 'Start a session',
                width: double.maxFinite,
                onTap: () async {
                  CommunityModal.showGuideLineModal<bool?>(context)
                      .then((value) {
                    if (value == true) {
                      context.pushNamed(CreateNexusScreen.name);
                    }
                  });
                },
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(
                  "Recovery Nexus",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColor.mainBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                pinned: true,
                floating: true,
                bottom: PreferredSize(
                  preferredSize: Size(
                    double.maxFinite,
                    38.h,
                  ),
                  child: Container(
                    margin: [20].pad,
                    padding: [2, 2].pad,
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: AppColor.gray,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: TabBar(
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      labelColor: AppColor.black,
                      unselectedLabelColor: AppColor.black,
                      unselectedLabelStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      indicator: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(1, 1),
                            blurRadius: 2,
                          )
                        ],
                      ),
                      tabs: const [
                        Tab(
                          text: 'Live Now',
                        ),
                        Tab(
                          text: 'Upcoming',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              for (var i = 0; i <= 1; i++)
                ListView.separated(
                  itemCount: 5,
                  padding: [20, 18, 20, 0].pad,
                  separatorBuilder: (context, index) => 24.verticalSpace,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        CommunityModal.showGuideLineModal<bool?>(context)
                            .then((value) {
                          if (value == true) {
                            CommunityModal.startListeningModal<bool?>(
                              context,
                            ).then((value) {
                              if (value == true) {
                                context.pushNamed(ListeningScreen.name);
                              }
                            });
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: const BoxDecoration(
                          color: AppColor.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Types of addiction, their impact, and common signs.",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.gray800,
                                    ),
                                  ),
                                ),
                                20.horizontalSpace,
                                const ColoredBackgroundText(
                                  backgroundColor: AppColor.error50,
                                  textColor: AppColor.error100,
                                  text: 'Live',
                                ),
                              ],
                            ),
                            2.verticalSpace,
                            Text(
                              "Mental wellness blog",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.gray400,
                              ),
                            ),
                            Row(
                              children: [
                                const SvgIcon(
                                  svg: AppSvg.microphone,
                                ),
                                8.horizontalSpace,
                                const SvgIcon(
                                  svg: AppSvg.audioWave,
                                ),
                                8.horizontalSpace,
                                AvatarStack(
                                  height: 35.h,
                                  width: 100.w,
                                  avatars: [
                                    for (var n = 0; n < 15; n++)
                                      const AssetImage(
                                        AppImages.face,
                                      ),
                                  ],
                                ),
                                8.horizontalSpace,
                                Text(
                                  "Listening",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.gray400,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
