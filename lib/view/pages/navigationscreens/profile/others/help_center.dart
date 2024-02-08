import 'package:flutter/material.dart';
import 'package:gp/view/widget/search_filed.dart';
import 'package:sizer/sizer.dart';

class HelpCenter extends StatelessWidget {
  HelpCenter({super.key});
 final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(children: [
          Searchfiled(
              onTap: () {},
              readOnly: true,
              height: 50,
              width: 90.w,
              controller: controller,
              hintText: 'What can we help?',
              onSubmitted: (value) {}),

        ]),
      ),
    );
  }
}
