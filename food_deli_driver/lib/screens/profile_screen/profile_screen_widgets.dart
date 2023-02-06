import 'package:flutter/material.dart';
import 'package:food_deli_driver/utils/extensions.dart';
import 'package:food_deli_driver/utils/messaging.dart';
import 'package:food_deli_driver/utils/styles.dart';
import 'package:sizer/sizer.dart';
import '../../utils/colors.dart';

// class ProfileimageModule extends StatelessWidget {
//   const ProfileimageModule({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           height: 28.h,
//           color: AppColors.profileAppbarColor,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: 110,
//                     width: 110,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.white, width: 2),
//                       image: const DecorationImage(
//                           image: NetworkImage(
//                               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ-YIPLhIBLVQKh_S4BNo18b03Ct5P_iYFeBBjDCYx&s"),
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                   SizedBox(width: 5.w),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Joshua Chacon",
//                         style: TextStyle(
//                             color: AppColors.whiteColor,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 3),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           const Icon(
//                             Icons.star,
//                             color: AppColors.whiteColor,
//                           ),
//                           Text(
//                             "2:55",
//                             style: TextStyle(
//                                 color: AppColors.whiteColor,
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         // mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             // height: 40,
//                             // width: 120,
//                             alignment: Alignment.centerRight,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                   width: 1, color: AppColors.whiteColor),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "Security",
//                                 style: TextStyle(
//                                     color: AppColors.whiteColor,
//                                     fontSize: 12.sp),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               ).commonOnlyPadding(top: 1.h),
//             ],
//           ).commonOnlyPadding(left: 20),
//         ),
//         Positioned(
//           bottom: -11.h,
//           child: Container(
//             height: 22.h,
//             width: 90.w,
//             // width: 102,
//             color: const Color.fromARGB(255, 142, 121, 128),
//           ).commonSymmetricPadding(horizontal: 20),
//         ),
//         SizedBox(height: 11.h),
//         Text("data")
//       ],
//     );
//   }
// }

class BlueBackgroundModule extends StatelessWidget {
  const BlueBackgroundModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26.h,
      decoration: const BoxDecoration(
        color: AppColors.profileAppbarColor,
      ),
    );
  }
}

class ProfileModule extends StatelessWidget {
  const ProfileModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            image: const DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ-YIPLhIBLVQKh_S4BNo18b03Ct5P_iYFeBBjDCYx&s"),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Joshua Chacon",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.whiteColor,
                  ),
                  Text(
                    "2:55",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: AppColors.whiteColor),
                    ),
                    child: Center(
                      child: Text(
                        "Security",
                        style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 12.sp),
                      ).commonSymmetricPadding(horizontal: 15, vertical: 5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 10, vertical: 5);
  }
}

class ProfileOtherModule extends StatelessWidget {
  const ProfileOtherModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 30.0),
          // BoxShadow(
          //   color: Colors.grey,
          //   blurRadius: 15.0, // soften the shadow
          //   spreadRadius: 5.0, //extend the shadow
          //   offset: Offset(
          //     5.0, // Move to right 5  horizontally
          //     5.0,
          //     // Move to bottom 5 Vertically
          //   ),
          // )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppMessage.earnedToday,
            style: TextStyleConfig.textStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 1.h),
          Text(
            AppMessage.rupees,
            style: TextStyleConfig.textStyle(
                fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1.h),
          const Divider(),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppMessage.totalTrip,
                    style: TextStyleConfig.textStyle(fontSize: 13.sp),
                  ),
                  Text(
                    "15",
                    style: TextStyleConfig.textStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.sp),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppMessage.timeOnline,
                    style: TextStyleConfig.textStyle(fontSize: 13.sp),
                  ),
                  Text(
                    "15h 30m",
                    style: TextStyleConfig.textStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.sp),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppMessage.totalDistance,
                    style: TextStyleConfig.textStyle(fontSize: 13.sp),
                  ),
                  Text(
                    "45 km",
                    style: TextStyleConfig.textStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.sp),
                  )
                ],
              )
            ],
          ),
        ],
      ).commonOnlyPadding(top: 20, right: 10, left: 10, bottom: 5),
    );
  }
}

class ProfileCallModule extends StatelessWidget {
  const ProfileCallModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 22.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 30.0),

          // BoxShadow(
          //   color: Colors.grey,
          //   blurRadius: 15.0, // soften the shadow
          //   spreadRadius: 5.0, //extend the shadow
          //   offset: Offset(
          //     5.0, // Move to right 5  horizontally
          //     5.0,
          //     // Move to bottom 5 Vertically
          //   ),
          // )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Text(
                    AppMessage.ongoingTrip,
                    style: TextStyleConfig.textStyle(fontSize: 13.sp),
                  )),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.greyColor),
                  child: Center(
                    child: Text(
                      AppMessage.wallet,
                      style: TextStyleConfig.textStyle(fontSize: 12.sp),
                    ).commonSymmetricPadding(horizontal: 15, vertical: 5),
                  ),
                ),
              ),
              const Expanded(flex: 1, child: Icon(Icons.more_vert_outlined))
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ-YIPLhIBLVQKh_S4BNo18b03Ct5P_iYFeBBjDCYx&s"),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Joshua Chacon",
                            style: TextStyleConfig.textStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold)),
                        Text("5:30pm",
                            style: TextStyleConfig.textStyle(fontSize: 14.sp)),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.blueColor,
                        ),
                        Text(
                          "2:55",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // SizedBox(height: 1.h),
                    // const Divider(),
                    // SizedBox(height: 1.h),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          const Divider(),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: AppColors.blueColor,
                  size: 4.h,
                ),
              ),
              Text(
                AppMessage.call,
                style: TextStyleConfig.textStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ).commonOnlyPadding(top: 20, right: 10, left: 10, bottom: 10),
    );
  }
}

class ListViewBuilderModule extends StatelessWidget {
  const ListViewBuilderModule({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      // clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.whiteColor,
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 30.0),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ-YIPLhIBLVQKh_S4BNo18b03Ct5P_iYFeBBjDCYx&s"),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Joshua Chacon",
                                style: TextStyleConfig.textStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("27 Dec, 2021",
                                style:
                                    TextStyleConfig.textStyle(fontSize: 12.sp)),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.blueColor,
                            ),
                            Text(
                              "2:55",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              const Divider(),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppMessage.amountPaid,
                        style: TextStyleConfig.textStyle(fontSize: 13.sp),
                      ),
                      Text(
                        "\$ 23.99",
                        style: TextStyleConfig.textStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppMessage.time,
                        style: TextStyleConfig.textStyle(fontSize: 13.sp),
                      ),
                      Text(
                        "30m",
                        style: TextStyleConfig.textStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppMessage.totalDistance,
                        style: TextStyleConfig.textStyle(fontSize: 13.sp),
                      ),
                      Text(
                        "45 km",
                        style: TextStyleConfig.textStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      )
                    ],
                  )
                ],
              )
            ],
          ).commonOnlyPadding(top: 20, right: 10, left: 10, bottom: 20),
        ).commonOnlyPadding(top: 4.h);
      },
    );
  }
}
