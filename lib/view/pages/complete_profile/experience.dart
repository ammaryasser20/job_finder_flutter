import 'package:flutter/material.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/models/experince_model.dart';
import 'package:gp/view/pages/complete_profile/education.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  bool isCurrentlyWork = false;
  final TextEditingController positionController = TextEditingController();

  final TextEditingController typeOfWorkController = TextEditingController();

  final TextEditingController companyNameController = TextEditingController();

  final TextEditingController locationController = TextEditingController();
  final TextEditingController startYearController = TextEditingController();

  final TextEditingController endYearController = TextEditingController();
  ExperinceModel? experinceModel;
  List<ExperinceModel> experienceList = [];
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
        title: const Text('Experience'),
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
                      controller: positionController,
                      text: 'Position *',
                    ),
                    NewTextFiled(
                      controller: typeOfWorkController,
                      text: 'Type of work',
                    ),
                    NewTextFiled(
                      controller: companyNameController,
                      text: 'Company name *',
                    ),
                    NewTextFiled(
                      controller: locationController,
                      text: 'Location',
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              activeColor: AppTheme.primaryColors,
                              value: isCurrentlyWork,
                              onChanged: (value) {
                                setState(() {
                                  isCurrentlyWork = value!;
                                });
                              }),
                        ),
                        Text(
                          'I am currently working in this role',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: AppTheme.neutralColors[900]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    NewTextFiled(
                      controller: startYearController,
                      text: 'Start Year *',
                    ),
                    Visibility(
                      maintainSize: false,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: !isCurrentlyWork,
                      child: NewTextFiled(
                        controller: endYearController,
                        text: 'end Year *',
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultBottoom(
                        text: 'save',
                        function: () async {
                          if (positionController.text.isNotEmpty &&
                              typeOfWorkController.text.isNotEmpty &&
                              companyNameController.text.isNotEmpty &&
                              locationController.text.isNotEmpty &&
                              startYearController.text.isNotEmpty) {
                            if (endYearController.text.isEmpty) {
                              DateTime now = DateTime.now();
                              DateFormat formatter = DateFormat('yyyy');
                              String formattedDate = formatter.format(now);
                              endYearController.text = formattedDate;
                            }
                            experinceModel = ExperinceModel(
                                userId:
                                    UserCubit.get(context).user!.id.toString(),
                                postion: positionController.text,
                                typeWork: typeOfWorkController.text,
                                compName: companyNameController.text,
                                location: locationController.text,
                                start: startYearController.text,
                                end: endYearController.text);

                            if (await UserCubit.get(context).addExperince(
                                experinceModel: experinceModel!,
                                token: UserCubit.get(context).user!.token!)) {
                              setState(() {
                                experienceList.add(experinceModel!);
                              });
                            }

                            UserCubit.get(context)
                                .competetStep(step: 2, value: 1);

                            //  Navigator.pop(context);
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
              if (experienceList.isNotEmpty)
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
                      itemCount: experienceList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppTheme.neutralColors[300]!),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.work),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                experienceList[index].postion!,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        color: AppTheme.neutralColors[900],
                                        fontWeight: AppTheme.mediumWeight),
                              ),
                            ),
                            subtitle: Text(
                                '${experienceList[index].typeWork}•${experienceList[index].compName} \n ${experienceList[index].start}-${experienceList[index].end}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: AppTheme.neutralColors[500],
                                    )),
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
