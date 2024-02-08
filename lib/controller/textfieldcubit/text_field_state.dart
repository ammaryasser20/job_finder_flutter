part of 'text_field_cubit.dart';


abstract class TextFieldState {}

final class TextFieldInitial extends TextFieldState {}
final class ChangeValid extends TextFieldState {}
final class ChangePasswordVisible extends TextFieldState {}
final class ChandIsEmpty extends TextFieldState {}
final class ClearTextField extends TextFieldState {}
