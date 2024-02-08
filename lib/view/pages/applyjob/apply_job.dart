import 'package:dio/dio.dart';
import 'package:easy_stepper/easy_stepper.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/const.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/local/db.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/pages/applyjob/SuccessfullyAppledJob.dart';

import 'package:gp/view/pages/applyjob/biodata.dart';
import 'package:gp/view/pages/applyjob/type_of_work.dart';
import 'package:gp/view/pages/applyjob/upload_portfolio.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:sizer/sizer.dart';

class ApplyJob extends StatelessWidget {
  const ApplyJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apply Job',
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            JobsCubit.get(context).changeActiveStep(active: 0);
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<JobsCubit, JobsState>(
              builder: (context, state) {
                return EasyStepper(
                    activeStep: JobsCubit.get(context).activeStep,
                    stepShape: StepShape.circle,
                    borderThickness: 2,
                    stepRadius: 25,
                    internalPadding: 5.w,
                    unreachedStepTextColor: AppTheme.neutralColors[900],
                    activeStepBorderColor: AppTheme.primaryColors,
                    activeStepTextColor: AppTheme.primaryColors,
                    finishedStepTextColor: AppTheme.primaryColors,
                    finishedStepBackgroundColor: Colors.white,
                    showLoadingAnimation: false,
                    defaultStepBorderType: BorderType.normal,
                    steps: [
                      EasyStep(
                        customStep: ClipRRect(
                          child: JobsCubit.get(context).activeStep > 0
                              ? SvgPicture.asset(
                                  'assets/images/stepdone.svg',
                                  width: 100,
                                )
                              : Text(
                                  '1',
                                  style: JobsCubit.get(context).activeStep ==
                                          0
                                      ? Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              color: AppTheme.primaryColors)
                                      : Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              color: AppTheme.primaryColors),
                                ),
                        ),
                        title: 'Biodata',
                      ),
                      EasyStep(
                          customStep: ClipRRect(
                            child: JobsCubit.get(context).activeStep > 1
                                ? SvgPicture.asset(
                                    'assets/images/stepdone.svg',
                                    width: 100,
                                  )
                                : Text(
                                    '2',
                                    style: JobsCubit.get(context)
                                                .activeStep ==
                                            1
                                        ? Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                                color: AppTheme.primaryColors)
                                        : Theme.of(context)
                                            .textTheme
                                            .displayLarge!,
                                  ),
                          ),
                          title: 'Type of work'),
                      EasyStep(
                        customStep: ClipRRect(
                          child: JobsCubit.get(context).activeStep > 2
                              ? SvgPicture.asset(
                                  'assets/images/stepdone.svg',
                                  width: 100,
                                )
                              : Text(
                                  '3',
                                  style: JobsCubit.get(context).activeStep ==
                                          2
                                      ? Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              color: AppTheme.primaryColors)
                                      : Theme.of(context)
                                          .textTheme
                                          .displayLarge!,
                                ),
                        ),
                        title: 'Upload portfolio',
                      ),
                    ],
                    onStepReached: (index) {
                      JobsCubit.get(context).changeActiveStep(active: index);
                    });
              },
            ),
            Expanded(
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                  } else if (direction == ScrollDirection.forward) {}
                  return true;
                },
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {},
                  controller: applyjobCon,
                  children: [
                    const Biodata(),
                    TypeOfWork(
                        work:
                            JobsCubit.get(context).applyedjob.data!.jobType!),
                    const UploadPortfolio()
                  ],
                ),
              ),
            ),
            BlocBuilder<JobsCubit, JobsState>(
              builder: (context, state) {
                return DefaultBottoom(
                    text: JobsCubit.get(context).activeStep == 2
                        ? 'Submit'
                        : 'Next',
                    function: () async {
                      if (applyjobCon.page == 0) {
                        if (fullNameCon.text.isNotEmpty &&
                            emailCon.text.contains('@') &&
                            handphoneCon.text.length == 13) {
                          JobsCubit.get(context).addApplyJob(
                            map: {
                              'jobId':
                                  JobsCubit.get(context).applyedjob.data!.id,
                              'fullName': fullNameCon.text,
                              'email': emailCon.text,
                              'handphone': handphoneCon.text,
                              'step': 1
                            },
                          );
        
                          JobsCubit.get(context).changeActiveStep(active: 1);
                          applyjobCon.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data is not complete')));
                        }
                      } else if (applyjobCon.page == 1) {
                        await JobsCubit.get(context).addApplyJob(
                          map: {
                            'jobId':
                                JobsCubit.get(context).applyedjob.data!.id,
                            'fullName': fullNameCon.text,
                            'email': emailCon.text,
                            'handphone': handphoneCon.text,
                            'typeOfWork': JobsCubit.get(context)
                                .applyedjob
                                .data!
                                .jobType,
                            'step': 2
                          },
                        );
                        JobsCubit.get(context).changeActiveStep(active: 2);
                        applyjobCon.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      } else if (applyjobCon.page == 2) {
                        if (JobsCubit.get(context).userCV != null &&
                            JobsCubit.get(context).otherFile != null) {
                          String cvName = JobsCubit.get(context)
                              .userCV!
                              .path
                              .split('/')
                              .last;
                          String otherFileName = JobsCubit.get(context)
                              .otherFile!
                              .path
                              .split('/')
                              .last;
        
                          FormData formData = FormData.fromMap({
                            "cv_file": await MultipartFile.fromFile(
                                JobsCubit.get(context).userCV!.path,
                                filename: cvName),
                            'name': fullNameCon.text,
                            'email': emailCon.text,
                            'mobile': handphoneCon.text,
                            'work_type': JobsCubit.get(context)
                                .applyedjob
                                .data!
                                .jobType!,
                            "other_file": await MultipartFile.fromFile(
                                JobsCubit.get(context).otherFile!.path,
                                filename: otherFileName),
                            "jobs_id":
                                JobsCubit.get(context).applyedjob.data!.id,
                            "user_id": UserCubit.get(context).user!.id,
                          });
                          if (await JobsCubit.get(context).addApplyJobOnAPI(
                              map: formData,
                              token: UserCubit.get(context).user!.token!)) {
                            MyDataBase db = MyDataBase();
                            db.deleteApplyJob(
                                jobId: JobsCubit.get(context)
                                    .applyedjob
                                    .data!
                                    .id!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SuccessfullyAppledJob()));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data is not complete')));
                        }
                      }
                    });
              },
            ),
            SizedBox(
              height: 3.h,
            )
          ],
        ),
      ),
    );
  }
}
