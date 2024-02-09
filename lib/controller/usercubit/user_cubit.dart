import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';
import 'package:gp/core/uitlites/enums.dart';
import 'package:gp/core/serves/cash_helper.dart';
import 'package:gp/main.dart';
import 'package:gp/models/experince_model.dart';
import 'package:gp/models/message.dart';
import 'package:gp/models/user.dart';
import 'package:gp/core/serves/dio_helper.dart';
import 'package:gp/models/user_info_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) =>
      BlocProvider.of(NavigationService.navigatorKey.currentContext!);
  User? user;
  Massage? massage;
  UserInfo? userInfo;
  List<File> userFiles = [];
  List<ExperinceModel> experinceModels = [];
  List<double> profileCompleting = [0, 0, 0, 0];

  Future<bool> addPortofolio(
      {required FormData map, required String token}) async {
    Response response = await DioHelper.postDataAndFiles(
        url: 'user/profile/portofolios', token: token, data: map);

    if (response.data['status'] == true) {
      response = await DioHelper.getData(
          url: 'user/profile/portofolios', token: user!.token);

      userInfo = UserInfo.fromJson(response.data);
      emit(PortofolioAdd());
      return true;
    }
    return false;
  }

  Future<bool> deletPortofolio({required int id, required String token}) async {
    Response response = await DioHelper.deleteData(
        url: 'user/profile/portofolios/$id', token: token);

    if (response.data['status'] == true) {
      response = await DioHelper.getData(
          url: 'user/profile/portofolios', token: user!.token);

      userInfo = UserInfo.fromJson(response.data);
      emit(PortofolioAdd());
      return true;
    }
    return false;
  }

  Future<bool> addExperince(
      {required ExperinceModel experinceModel, required String token}) async {
    Response response = await DioHelper.postData(
        url: 'experince', data: experinceModel.toMap(), token: token);

    if (response.data['status'] == true) {
      experinceModels.add(experinceModel);
      return true;
    }
    return false;
  }

  void competetStep({required int step, required double value}) {
    profileCompleting[step] = value;
    emit(CompetetStep());
  }

  void logout() {
    user = null;
    massage = null;
    userInfo = null;
    userFiles = [];
    experinceModels = [];
    profileCompleting = [0, 0, 0, 0];
  }

  String language = CashHelper.getString(key: Keys.language).isEmpty
      ? 'English'
      : CashHelper.getString(key: Keys.language);
  List<String> userCountry = [];
  bool rememberMy = false;
  void changLanguage({required String lang}) {
    language = lang;
    CashHelper.putString(key: Keys.language, value: lang);
    emit(ChangingLanguage());
  }

  Future<bool> register(
      {required String name,
      required String email,
      required String pass}) async {
    emit(RegisterLoading());
    Response response = await DioHelper.postData(url: registerUrl, data: {
      'name': name,
      'email': email,
      'password': pass,
    });

    if (response.data['status'].toString() == "true") {
      user = User.register(response.data);

      emit(RegisterSuccessful());
      return true;
    } else {
      massage = Massage.register(response.data);
      emit(RegisterFall());
      return false;
    }
  }

  Future<bool> getProfile(String token) async {
    emit(GetProfileLoading());
    Response response =
        await DioHelper.getData(url: 'auth/profile', token: token);

    if (response.data['status'].toString() == "true") {
      user = User.profile(response.data, token);
      //     await CashHelper.putString(key: Keys.tokenKey, value: user.token!);
      response = await DioHelper.getData(
          url: 'user/profile/portofolios', token: user!.token);

      userInfo = UserInfo.fromJson(response.data);
      emit(GetProfileSuccessful());
      return true;
    } else {
      massage = Massage.register(response.data);
      emit(GetProfileFall());
      return false;
    }
  }

  Future<bool> changeName({required String name, required String token}) async {
    Response response = await DioHelper.postData(
        url: 'auth/user/update', data: {'name': name}, token: token);

    if (response.data['status']) {
      user!.name = response.data['data']['name'];

      emit(ChangeNameSuccessful());
      return true;
    } else {
      emit(ChangeNameFall());
      return false;
    }
  }

  Future<bool> logIn({required String email, required String pass}) async {
    emit(LogInLoading());
    //
    Response response = await DioHelper.postData(url: logInUrl, data: {
      'email': email,
      'password': pass,
    });

    if (response.data['status'].toString() == "true") {
      user = User.login(response.data);
      response = await DioHelper.getData(
          url: 'user/profile/portofolios', token: user!.token);
      print(response.data);
      userInfo = UserInfo.fromJson(response.data);
      emit(LogInSuccessful());

      return true;
    } else {
      massage = Massage.login(response.data);

      emit(LogInFall());
      return false;
    }
  }

  void addWork() {
    emit(AddWork());
  }

  void addCountry({required String country}) {
    userCountry.add(country);
    emit(AddCountry());
  }

  void removeCountry({required String country}) {
    userCountry.remove(country);
    emit(RemoveCountry());
  }

  void changeRememberMy() {
    rememberMy = !rememberMy;
    emit(ChangeRememberMy());
  }
}
