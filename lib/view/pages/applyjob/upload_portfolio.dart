import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/controller/jobscubit/jobs_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:path/path.dart';
import 'package:sizer/sizer.dart';

class UploadPortfolio extends StatelessWidget {
  const UploadPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload portfolio',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Fill in your bio data correctly',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: AppTheme.mediumWeight),
                children: [
                  TextSpan(
                      text: 'Upload CV',
                      style: TextStyle(color: AppTheme.neutralColors[900])),
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: AppTheme.dangerColors),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<JobsCubit, JobsState>(
              builder: (context, state) {
                String fileSize = '';
                if (JobsCubit.get(context).userCV != null) {
                  fileSize =
                      getFileSize(JobsCubit.get(context).userCV!.path, 1);
                }
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    height: 12.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.neutralColors[300]!),
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        'assets/images/cv-upload.svg',
                      ),
                      title: Text(
                        JobsCubit.get(context).userCV == null
                            ? 'Upload your CV'
                            : basename(JobsCubit.get(context).userCV!.path),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: AppTheme.mediumWeight,
                                color: AppTheme.neutralColors[900]),
                      ),
                      subtitle: Text(
                        JobsCubit.get(context).userCV != null
                            ? fileSize
                            : 'must be pdf',
                      ),
                      trailing: JobsCubit.get(context).userCV == null
                          ? InkWell(
                              onTap: () async {
                                JobsCubit.get(context)
                                    .abbCV(newCV: await getFile());
                              },
                              child: SvgPicture.asset('assets/images/edit.svg'))
                          : InkWell(
                              onTap: () {
                                JobsCubit.get(context).abbCV(newCV: null);
                              },
                              child: const Icon(
                                Icons.highlight_remove_sharp,
                                color: Colors.red,
                              ),
                            ),
                    ));
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Other File',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: AppTheme.mediumWeight,
                  color: AppTheme.neutralColors[900]),
            ),
            SizedBox(
              height: 1.h,
            ),
            InkWell(
              onTap: () async {
                JobsCubit.get(context)
                    .abbOtherFile(newOtherFile: await getFile());
              },
              child: SvgPicture.asset(
                'assets/images/Upload document.svg',
              ),
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

Future<File?> getFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    File file = File(result.files.single.path!);

    return file;
  } else {
    return null;
  }
}

String getFileSize(String filepath, int decimals) {
  var file = File(filepath);
  int bytes = file.lengthSync();
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}
