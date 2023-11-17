import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexle_corporation/core/view_models/screens/interfaces/icategory_viewmodel.dart';
import 'package:nexle_corporation/ui/common_widgets/background.dart';
import 'package:provider/provider.dart';

part './widgets/category_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late ICategoryViewModel _categoryViewModel;
  @override
  void initState() {
    _categoryViewModel = context.read<ICategoryViewModel>();
    Future.delayed(Duration.zero, () async {
      _categoryViewModel.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(imagePath: 'assets/images/image 304.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 160.h,
                    ),
                    Text(
                      "Wellcome to Flutter Test",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Please select categories what you would like to see on your feed. You can set this later on Filter.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Consumer<ICategoryViewModel>(
                      builder: (_, vm, __) {
                        return Wrap(
                          spacing: 8.w,
                          runSpacing: 10.h,
                          children: vm.categories
                              .map(
                                (e) => _CategoryItem(
                                  onTap: () => vm.selectCategory(e.id),
                                  name: e.name,
                                  isSelected: e.isSelected,
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
