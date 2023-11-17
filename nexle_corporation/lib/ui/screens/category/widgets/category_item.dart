part of '../category_screen.dart';

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });
  final String name;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 108.w,
        height: 71.h,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff8a31a8), Color(0xff8a00ff)],
                ),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.white,
                )),
        child: Center(
          child: Text(name,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
