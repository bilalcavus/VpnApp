import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vpn_app/core/helper/dynamic_size_helper.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key, 
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.08),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: _buildNavItem(
              context,
              index: 0,
              icon: HugeIcons.strokeRoundedHome04,
              label: 'Countries'
            ),
          ),
          Expanded(
            child: _buildNavItem(
              context,
              index: 1,
              icon: HugeIcons.strokeRoundedLiveStreaming02,
              label: 'Disconnect'
            ),
          ),
          Expanded(
            child: _buildNavItem(
              context,
              index: 2,
              icon: HugeIcons.strokeRoundedSettings03,
              label: 'Setting'
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String label,
    VoidCallback? onTapOverride,
  }) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: onTapOverride ?? () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xff1A5CFF) : Colors.black,
            size: context.dynamicWidth(0.06),
          ),
          SizedBox(height: context.dynamicHeight(0.005)),
          Text(
            label,
            style: TextStyle(
              color:  isSelected ? const Color(0xff1A5CFF) : Colors.black,
              fontSize: context.dynamicHeight(0.014),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}