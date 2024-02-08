import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_route.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:gp/view/widget/graf_select_items.dart';
import 'package:sizer/sizer.dart';

class CreatAcc2 extends StatefulWidget {
  const CreatAcc2({super.key});

  @override
  State<CreatAcc2> createState() => _CreatAcc2State();
}

class _CreatAcc2State extends State<CreatAcc2> {
  final DragSelectGridViewController controller =
      DragSelectGridViewController();
  @override
  void initState() {
    super.initState();
    controller.addListener(UserCubit.get(context).addWork);
  }

  @override
  void dispose() {
    controller.removeListener(UserCubit.get(context).addWork);
    super.dispose();
  }

  void scheduleRebuild() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(7.w),
          child: Column(
            children: [
              Text(
                "What type of work are you interested in?",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                  "Tell us what you’re interested in so we can customise the app for your needs.",
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                height: 4.h,
              ),
              Expanded(
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return DragSelectGridView(
                      gridController: controller,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2.h,
                          crossAxisSpacing: 5.w),
                      itemBuilder:
                          (BuildContext context, int index, bool selected) {
                        return GrafSelectItems(
                          isSelected: selected,
                          index: index,
                        );
                      },
                    );
                  },
                ),
              ),
              DefaultBottoom(
                  text: "Next",
                  function: () {
                    Navigator.pushNamed(context, AppRoute.wayOfWork);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
