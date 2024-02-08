import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/local/db.dart';
import 'package:gp/core/serves/dio_helper.dart';
import 'package:gp/models/apply_job_model.dart';
import 'package:gp/models/job.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());
  static JobsCubit get(context) => BlocProvider.of(context);
  late Job openJob;
  late Data data;
  late Job applyedjob;
  // String? typeOfWork;
  int activeStep = 0;
  File? userCV;
  File? otherFile;
  List<Job> jobs = [];
  List<Job?> recentJob = [];
  List<int> recentJobID = [];
  List<ApplyJobModel> applyJobsfromDB = [];
  List<ApplyJobModel> applyJobsfromAPI = [];
  List<Job> savedJob = [];
  late ApplyJobModel applyJobModel;
  Map savedJobsIDs = {};
  void clear() {
    // typeOfWork = '';
    activeStep = 0;
    userCV = null;
    otherFile = null;
    jobs = [];
    recentJob = [];
    recentJobID = [];
    applyJobsfromDB = [];
    applyJobsfromAPI = [];
    savedJob = [];
    savedJobsIDs = {};
    emit(ClearJobs());
  }

  abbCV({required File? newCV}) {
    userCV = newCV;
    emit(AddCV());
  }

  abbOtherFile({required File? newOtherFile}) {
    otherFile = newOtherFile;
    emit(AddOtherFile());
  }

  // void changeTypeOfWork({required String newTypeOfWork}) {
  //   typeOfWork = newTypeOfWork;
  //   emit(ChangeTypeOfWork());
  // }

  void changeActiveStep({required int active}) {
    activeStep = active;
    emit(ChangeActiveStep());
  }

  Future<void> getApplyJobsfromDB() async {
    emit(LoadingAllApplyJobFromDB());
    applyJobsfromDB = [];
    MyDataBase dataBase = MyDataBase();
    applyJobsfromDB = await dataBase.getApplyJob();
    emit(GetAllApplyJobFromDB());
  }

  Future<void> getApplyJobsfromAPI(BuildContext context) async {
    emit(LoadingAllApplyJobFromAPI());
    applyJobsfromAPI = [];
    Response response = await DioHelper.getData(
        url: 'apply/${UserCubit.get(context).user!.id}',
        token: UserCubit.get(context).user!.token);

    if (response.data['data'].isNotEmpty) {
      response.data['data'].forEach((v) {
        applyJobModel = ApplyJobModel.fromAPI(v);
        applyJobsfromAPI.add(applyJobModel);
      });
    }
    emit(GetAllApplyJobFromAPI());
  }

  Future<void> getAllApplyJob(BuildContext context) async {
    applyJobsfromDB = [];
    applyJobsfromAPI = [];
    emit(LoadingAllApplyJob());
    MyDataBase dataBase = MyDataBase();
    applyJobsfromDB = await dataBase.getApplyJob();
    Response response = await DioHelper.getData(
        url: 'apply/${UserCubit.get(context).user!.id}',
        token: UserCubit.get(context).user!.token);

    if (response.data['data'].isNotEmpty) {
      response.data['data'].forEach((v) {
        applyJobModel = ApplyJobModel.fromAPI(v);
        applyJobsfromAPI.add(applyJobModel);
      });
    }
    //applyJobs = [...applyJobsfromDB, ...applyJobsfromAPI];
    emit(GetAllApplyJob());
  }

  Future<void> getAllSavingJob(BuildContext context) async {
    Response response = await DioHelper.getData(
        url: 'favorites', token: UserCubit.get(context).user!.token);

    if (response.data['status']) {
      response.data['data'].forEach((v) {
        data = Data.fromJson(v['jobs']);

        savedJob.add(Job(status: true, data: data));
        savedJobsIDs.addAll({v['job_id']: v['id']});
      });
    }
  }

  Future<void> addJobs(BuildContext context) async {
    emit(LoadingAllJob());
    Response response = await DioHelper.getData(
        url: 'jobs', token: UserCubit.get(context).user!.token);
    response.data['data'].forEach((v) {
      data = Data.fromJson(v);
      jobs.add(Job(status: true, data: data));
    });
    await getAllSavingJob(context);
    // Response responseSaved = await DioHelper.getData(
    //     url: 'favorites', token: UserCubit.get(context).user.token);
    // print(responseSaved.data);
    // if (responseSaved.data['status']) {
    //   responseSaved.data['data'].forEach((v) {
    //     savedJobsIDs.addAll({v['job_id']: v['id']});
    //   });
    // }
    getAllApplyJob(context);

    MyDataBase myDataBase = MyDataBase();
    recentJobID = await myDataBase.getRecentJobs();
    if (recentJobID.isNotEmpty) {
      for (int id in recentJobID) {
        recentJob.add(await getJobByID(
            id: id, token: UserCubit.get(context).user!.token!));
      }
    }

    emit(JopsAdded());
  }

  addOpenJob({required Job job}) {
    openJob = job;
    emit(OpeningJob());
  }

  Future<void> addRecentJob(Job job) async {
    MyDataBase myDataBase = MyDataBase();

    if (await myDataBase.insertRecentJobs(id: job.data!.id!)) {
      recentJobID.add(job.data!.id!);
      recentJob.add(job);
      emit(RecentJobAdded());
    }
  }

  Future<Job?> getJobByID({required int id, required String token}) async {
    Response response = await DioHelper.getData(url: 'jobs/$id', token: token);

    if (response.data['status'] == true) {
      Job damyJob = Job.fromJson(response.data);

      return damyJob;
    }
    return null;
  }

  Future<void> saveingJob(
      {required int id, required BuildContext context}) async {
    savedJob = [];
    await DioHelper.postData(
        url: 'favorites/',
        token: UserCubit.get(context).user!.token,
        data: {"job_id": id});
    Response responseSaved = await DioHelper.getData(
        url: 'favorites', token: UserCubit.get(context).user!.token);

    if (responseSaved.data['status']) {
      responseSaved.data['data'].forEach((v) {
        data = Data.fromJson(v['jobs']);
        savedJob.add(Job(status: true, data: data));
        savedJobsIDs.addAll({v['job_id']: v['id']});
      });
    }
    emit(SaveingJobDone());
  }

  Future<void> deleteSavedJob(
      {required int id, required BuildContext context}) async {
    await DioHelper.deleteData(
        url: 'favorites/${savedJobsIDs[id]}',
        token: UserCubit.get(context).user!.token,
        data: {"job_id": id});
    savedJobsIDs.remove(id);

    savedJob.removeWhere((element) => id == element.data!.id);

    emit(DeleteJobDone());
  }

  Future<void> addApplyJob({required Map<String, dynamic> map}) async {
    MyDataBase db = MyDataBase();
    await db.insertApplyJob(newApply: ApplyJobModel.fromDB(map));
    await getApplyJobsfromDB();
  }

  Future<bool> addApplyJobOnAPI(
      {required FormData map, required String token}) async {
    Response response =
        await DioHelper.postDataAndFiles(url: 'apply', token: token, data: map);
    print(response.data);
    if (response.data['status']) {
      return true;
    }
    return false;
  }
}
