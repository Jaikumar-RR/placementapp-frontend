import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:final_tpc_app/app/controllers/staff_pages_contoller/drawer_controllers/HomeScreenControllers/PlacementWillingController/PlacementWillingController.dart';
import 'package:final_tpc_app/app/controllers/theme_controller/app_color_controller.dart';

class PlacementWillingList extends StatelessWidget {
  const PlacementWillingList({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    final PlacementwillingController controller =
        Get.put(PlacementwillingController());

    return Obx(() {
      return Scaffold(
        backgroundColor: themeController.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeController.secondaryColor,
          leading: IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Placement Willing Students",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              // Search Bar and Filter Button Row
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: controller.filterStudentsByName,
                      decoration: InputDecoration(
                        hintText: "Search your job...",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      controller.openFilterOptions(context);
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                        color: themeController.secondaryColor,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Icon(
                        Icons.tune,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Obx(() {
                if (controller.isLoading.value) {
                  // Shimmer Effect for Loading
                  return Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (_, __) => SizedBox(height: 10.h),
                      itemBuilder: (context, index) {
                        return CardLoading(
                          height: 100,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          margin: EdgeInsets.only(bottom: 10),
                        );
                      },
                    ),
                  );
                }
                // Student List with RefreshIndicator
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.fetchStudents(); // Re-fetch data
                    },
                    child: ListView.separated(
                      itemCount: controller.filteredStudents.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.h),
                      itemBuilder: (context, index) {
                        final student = controller.filteredStudents[index];
                        return Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: themeController.isDarkMode
                                ? themeController.secondaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25.r,
                                backgroundImage: NetworkImage(student.imageUrl),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      student.name,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: themeController.textColor),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "Roll No: ${student.rollno}",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: themeController.textColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.purple[100],
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  "${student.cgpa} CGPA",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}
