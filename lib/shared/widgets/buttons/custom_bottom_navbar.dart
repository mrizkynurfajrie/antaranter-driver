import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'package:intake_rider/shared/widgets/menus/menu_item_image.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  final Function(int index) onTap;
  final int selectedIndex;

  Widget _itemMenu(
    BuildContext context, {
    required Function() onTap,
    required String label,
    required bool isSelected,
    required String iconPrimary,
    required Color primaryColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Sizes.med,
            height: Sizes.med,
            // margin: EdgeInsets.only(bottom: Insets.xs),
            child: MenuItemImage(
              primaryIcon: iconPrimary,
              primaryColor:
                  isSelected ? primaryColor : AppColor.neutral.shade300,
            ),
            // child: SvgPicture.asset(
            //   icon,
            //   color: isSelected
            //       ? Color(int.parse("0xFF" +
            //           Get.find<ControllerUserInfo>().issuerPrimaryColor.value))
            //       : AppColor.bodyColor.shade400,
            // ),
          ),
          Text(
            label,
            style: TextStyles.text2xs.copyWith(
              color: isSelected
                  ? AppColor.primaryColor
                  : AppColor.bodyColor.shade400,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (IconSizes.xxl - 10.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _itemMenu(
            context,
            onTap: () {
              onTap(0);
            },
            label: 'Home',
            isSelected: selectedIndex == 0,
            iconPrimary: AppIcons.home,
            primaryColor: AppColor.primaryColor,
          ),
          Stack(
            children: [
              _itemMenu(
                context,
                onTap: () {
                  onTap(1);
                },
                label: 'Activity'.tr,
                isSelected: selectedIndex == 1,
                iconPrimary: AppIcons.activity,
                primaryColor: AppColor.primaryColor,
              ),
              GetBuilder<ControllerRiderInfo>(
                builder: (control) => Positioned(
                  top: 2.w,
                  right: 0,
                  child: Get.find<ControllerRiderInfo>().hasActivePost.isTrue
                      ? Icon(
                          Icons.brightness_1,
                          size: 8.0.w,
                          color: AppColor.primaryColor,
                        )
                      : Container(),
                ),
              )
            ],
          ),
          _itemMenu(
            context,
            onTap: () {
              onTap(2);
            },
            label: 'Profile',
            isSelected: selectedIndex == 2,
            iconPrimary: AppIcons.profile,
            primaryColor: AppColor.primaryColor,
          ),
        ],
      ),
    );
  }
}
