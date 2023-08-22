import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';

class ODOSCircleAvatarList extends StatelessWidget {
  int itemCount;

  ODOSCircleAvatarList({
    required this.itemCount,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverPersistentHeaderDelegate(
            minHeight: 50,
            maxHeight: 50,
            child: Container(
              decoration: BoxDecoration(color: AppColors.white),
              child: ODOSCircleAvatarButton(onTap: () {}),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverPersistentHeaderDelegate(
            minHeight: 10,
            maxHeight: 10,
            child: Container(
              decoration: BoxDecoration(color: AppColors.white),
              child: const Align(
                alignment: Alignment.centerRight,
                child: VerticalDivider(
                  width: 5,
                  thickness: 1,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: itemCount,
            (context, index) {
              if (index == itemCount) {
                return ODOSAddFriendButton();
              } else {
                return ODOSCircleAvatarButton(onTap: () {});
              }
            },
          ),
        )
      ],
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class ODOSCircleAvatarButton extends StatelessWidget {
  void Function()? onTap;

  ODOSCircleAvatarButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        radius: 30,
        child: ClipOval(
          child: Image.asset(AppString.profile[0]),
        ),
      ),
      onTap: () {},
    );
  }
}

class ODOSAddFriendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray500,
      ),
      child: Icon(Icons.add),
    );
  }
}
