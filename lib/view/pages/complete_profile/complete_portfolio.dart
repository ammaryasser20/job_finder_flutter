import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/pages/applyjob/upload_portfolio.dart';
import 'package:path/path.dart';

import 'package:sizer/sizer.dart';

class CompletePortfolio extends StatelessWidget {
  const CompletePortfolio({super.key});

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
        title: const Text('Portfolio'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add portfolio here',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () async {
                        File? file = await getFile();
                        if (file != null) {
                          String cvName = file.path.split('/').last;

                          FormData formData = FormData.fromMap(
                            {
                              'cv_file': await MultipartFile.fromFile(file.path,
                                  filename: cvName),
                              'image': await MultipartFile.fromFile(file.path,
                                  filename: cvName)
                            },
                          );

                          await UserCubit.get(context).addPortofolio(
                              map: formData,
                              token: UserCubit.get(context).user!.token!);
                          UserCubit.get(context)
                              .competetStep(step: 3, value: 1);
                        }
                      },
                      child: SvgPicture.asset(
                          'assets/images/Upload document.svg')),
                  const SizedBox(
                    height: 20,
                  ),
                   if (UserCubit.get(context).userInfo != null &&
                      UserCubit.get(context).userInfo!.allInfo!.portfolio !=
                          null)
                    if (UserCubit.get(context)
                        .userInfo!
                        .allInfo!
                        .portfolio!
                        .isNotEmpty)
                    SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: double.infinity,
                                height: 12.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppTheme.neutralColors[300]!),
                                ),
                                child: ListTile(
                                  leading: SvgPicture.asset(
                                    'assets/images/cv-upload.svg',
                                  ),
                                  title: Text(
                                    basename(UserCubit.get(context)
                                        .userInfo!
                                        .allInfo!
                                        .portfolio![index]
                                        .image!),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            fontWeight: AppTheme.mediumWeight,
                                            color: AppTheme.neutralColors[900]),
                                  ),
                                  subtitle: Text(
                                    'must be pdf',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: AppTheme.neutralColors),
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      UserCubit.get(context).deletPortofolio(
                                          id: UserCubit.get(context)
                                              .userInfo!
                                              .allInfo!
                                              .portfolio![index]
                                              .id!,
                                          token: UserCubit.get(context)
                                              .user!
                                              .token!);
                                      if (UserCubit.get(context)
                                              .userInfo!
                                              .allInfo!
                                              .portfolio ==
                                          null) {
                                        UserCubit.get(context)
                                            .competetStep(step: 3, value: 0);
                                      } else if (UserCubit.get(context)
                                          .userInfo!
                                          .allInfo!
                                          .portfolio!
                                          .isEmpty) {
                                        UserCubit.get(context)
                                            .competetStep(step: 3, value: 0);
                                      }
                                    },
                                    child: const Icon(
                                      Icons.highlight_remove_sharp,
                                      color: Colors.red,
                                    ),
                                  ),
                                ));
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 3.h,
                            );
                          },
                          itemCount: UserCubit.get(context)
                              .userInfo!
                              .allInfo!
                              .portfolio!
                              .length),
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
