part of '../jobscubit/jobs_cubit.dart';


abstract class JobsState {}

final class JobsInitial extends JobsState {}

final class LoadingAllJob extends JobsState {}
final class JopsAdded extends JobsState {}
final class SaveingJobDone extends JobsState {}
final class DeleteJobDone extends JobsState {}
final class RecentJobAdded extends JobsState {}
final class OpeningJob extends JobsState {}
final class ChangeActiveStep extends JobsState {}
final class ChangeTypeOfWork extends JobsState {}
final class AddCV extends JobsState {}
final class AddOtherFile extends JobsState {}
final class ClearJobs extends JobsState {}
final class LoadingAllApplyJob extends JobsState {}
final class GetAllApplyJob extends JobsState {}
final class LoadingAllApplyJobFromDB extends JobsState {}
final class GetAllApplyJobFromDB extends JobsState {}
final class LoadingAllApplyJobFromAPI extends JobsState {}
final class GetAllApplyJobFromAPI extends JobsState {}