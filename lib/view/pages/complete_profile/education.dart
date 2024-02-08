import 'package:flutter/material.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/local/db.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:sizer/sizer.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final TextEditingController universityController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController startYearController = TextEditingController();

  final TextEditingController endYearController = TextEditingController();
  List<Map<String, dynamic>>? educationList;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    MyDataBase dataBase = MyDataBase();
    educationList = await dataBase.getAllEducation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('Education'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.neutralColors[300]!),
                ),
                child: Column(
                  children: [
                    NewTextFiled(
                      controller: universityController,
                      text: 'University *',
                    ),
                    NewTextFiled(
                      controller: titleController,
                      text: 'Title',
                    ),
                    NewTextFiled(
                      suffix: Icons.calendar_month_outlined,
                      controller: startYearController,
                      text: 'Start Year',
                    ),
                    NewTextFiled(
                      suffix: Icons.calendar_month_outlined,
                      controller: endYearController,
                      text: 'End Year',
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultBottoom(
                        text: 'save',
                        function: () async {
                          if (universityController.text.isNotEmpty &&
                              titleController.text.isNotEmpty &&
                              startYearController.text.isNotEmpty &&
                              endYearController.text.isNotEmpty) {
                            MyDataBase dataBase = MyDataBase();
                            dataBase.insertEducation(map: {
                              'university': universityController.text,
                              'title': titleController.text,
                              'start': startYearController.text,
                              'end': endYearController.text,
                            });
                            educationList = await dataBase.getAllEducation();
                            setState(() {});
                            UserCubit.get(context)
                                .competetStep(step: 1, value: 1);
                          }
                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              if (educationList != null)
                SizedBox(
                  width: 100.w,
                  height: 50.h,
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: educationList!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: AppTheme.neutralColors[300]!),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.cast_for_education),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                educationList![index]['university'],
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        color: AppTheme.neutralColors[900],
                                        fontWeight: AppTheme.mediumWeight),
                              ),
                            ),
                            subtitle: Text(
                              '${educationList![index]['title']} \n${educationList![index]['start']}-${educationList![index]['end']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: AppTheme.neutralColors[500],
                                  ),
                            ),
                          ),
                        );
                      }),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class NewTextFiled extends StatelessWidget {
  const NewTextFiled(
      {super.key, required this.controller, this.suffix, required this.text});
  final TextEditingController controller;
  final IconData? suffix;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 5, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppTheme.neutralColors[400],
                fontWeight: AppTheme.mediumWeight),
          ),
          SizedBox(
            height: .5.h,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                suffixIcon: suffix != null ? Icon(suffix) : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.neutralColors[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.primaryColors[500]!),
                )),
          ),
        ],
      ),
    );
  }
}
