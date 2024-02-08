part of 'user_cubit.dart';

abstract class UserState {}

final class UserInitial extends UserState {}
final class RegisterLoading extends UserState {}
final class RegisterSuccessful extends UserState {}
final class RegisterFall extends UserState {}
final class LogInLoading extends UserState {}
final class LogInSuccessful extends UserState {}
final class LogInFall extends UserState {}
final class GetProfileLoading extends UserState {}
final class GetProfileSuccessful extends UserState {}
final class GetProfileFall  extends UserState {}
final class AddWork extends UserState {}
final class AddCountry extends UserState {}

final class RemoveCountry extends UserState {}

final class ChangeRememberMy extends UserState {}

final class ChangeNameSuccessful extends UserState {}
final class ChangeNameFall extends UserState {}
final class ChangingLanguage extends UserState {}
final class ClearUser extends UserState {}
final class CompetetStep extends UserState {}
final class PortofolioAdd extends UserState {}