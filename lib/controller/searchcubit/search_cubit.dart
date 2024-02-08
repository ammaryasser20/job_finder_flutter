import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/core/local/db.dart';
import 'package:gp/core/serves/dio_helper.dart';
import 'package:gp/models/job.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  bool isEmpty = true;
  String? mySearch;
  List<Job> searchJob = [];
  List<String> recentsearches = [];
  List<String> jopsType = [];
  void clear() {
    isEmpty = true;
    mySearch = null;
    searchJob = [];
    recentsearches = [];
    jopsType = [];
    emit(ClearSearch());
  }

  void clearJopsType() {
    jopsType.clear();
    emit(ClearingJopType());
  }

  void changeIsEmpty({required bool value}) {
    isEmpty = value;
    emit(ChangeIsEmpty());
  }

  addJobType({required String jobType}) {
    jopsType.add(jobType);
    emit(JobTypeAdd());
  }

  removeJobType({required String jobType}) {
    jopsType.remove(jobType);
    emit(JobTyperemoved());
  }

  Future<void> getAllRecentSearches() async {
    MyDataBase myDataBase = MyDataBase();
    recentsearches = await myDataBase.getRecentSearches();
    emit(ShowAllRecentSearches());
  }

  Future<void> addRecentSearches({required String recent}) async {
    MyDataBase myDataBase = MyDataBase();
    if (await myDataBase.insertRecentSearcheJob(recent: recent)) {
      recentsearches.add(recent);
    }
    emit(AddRecentSearches());
  }

  Future<void> deleteRecentSearcheJob({required String recent}) async {
    MyDataBase myDataBase = MyDataBase();
    myDataBase.deleteRecentSearcheJob(recent: recent);
    recentsearches.remove(recent);
    emit(DeleteRecentSearcheJob());
  }

  void addSearch(
      {String? name,
      String? location,
      String? salary,
      required String token}) async {
    searchJob = [];

    Response response = await DioHelper.postData(
      url: 'jobs/filter',
      token: token,
      data: {
        'name': name,
        'location': location,
        'salary': salary,
      },
    );
    if (response.data['status'] == true) {
      if (response.data['data'] != null) {
        response.data['data'].forEach((v) {
          Data damyData = Data.fromJson(v);

          searchJob.add(Job(status: true, data: damyData));
        });
      }
    }
    emit(AddSearch());
  }
}
