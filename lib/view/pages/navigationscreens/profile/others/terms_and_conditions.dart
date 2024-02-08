import 'package:flutter/material.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:sizer/sizer.dart';

class TremsAndConditions extends StatelessWidget {
  const TremsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Lorem ipsum dolor',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppTheme.neutralColors),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Lorem ipsum dolor',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppTheme.neutralColors),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: AppTheme.neutralColors[100],
              child: Text(
                'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppTheme.neutralColors),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppTheme.neutralColors),
            ),
          ]),
        ),
      ),
    );
  }
}
