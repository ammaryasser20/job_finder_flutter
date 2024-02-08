import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/controller/usercubit/user_cubit.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/core/uitlites/enums.dart';
import 'package:gp/core/serves/cash_helper.dart';
import 'package:gp/view/widget/default_bottom.dart';
import 'package:gp/view/widget/edit_textfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = UserCubit.get(context).user!.name!;

    bioController.text = CashHelper.getString(key: Keys.bio).isNotEmpty
        ? CashHelper.getString(key: Keys.bio)
        : 'No bio';
    addressController.text = CashHelper.getString(key: Keys.address).isNotEmpty
        ? CashHelper.getString(key: Keys.address)
        : 'No Address';
    phoneController.text = UserCubit.get(context).user!.name!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Edite Profile',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Image.asset(
                      CashHelper.getString(key: Keys.photo).isNotEmpty
                          ? CashHelper.getString(key: Keys.photo)
                          : 'assets/images/Profile.png',
                    ),
                    Positioned(
                      top: 25,
                      left: 25,
                      child: SvgPicture.asset('assets/images/camera.svg'),
                    )
                  ],
                ),
              ),
              Center(
                child: Text(
                  'Change Photo',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppTheme.primaryColors,
                      fontWeight: AppTheme.mediumWeight),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Name',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppTheme.neutralColors[400],
                    fontWeight: AppTheme.mediumWeight),
              ),
              SizedBox(
                height: .5.h,
              ),
              EditTextField(
                controller: nameController,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Bio',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppTheme.neutralColors[400],
                    fontWeight: AppTheme.mediumWeight),
              ),
              SizedBox(
                height: .5.h,
              ),
              EditTextField(
                controller: bioController,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Address',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppTheme.neutralColors[400],
                    fontWeight: AppTheme.mediumWeight),
              ),
              SizedBox(
                height: .5.h,
              ),
              EditTextField(
                controller: addressController,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'No.Handphone',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppTheme.neutralColors[400],
                    fontWeight: AppTheme.mediumWeight),
              ),
              SizedBox(
                height: .5.h,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppTheme.neutralColors[300]!,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppTheme.primaryColors),
                  ),
                ),
                initialCountryCode: 'EG',
                onChanged: (phone) {
                  phoneController.text = phone.completeNumber;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: DefaultBottoom(
                  text: 'Save',
                  function: () async {
                    if (nameController.text.isNotEmpty) {
                      print('nameController.text.isNotEmpty');
                      await UserCubit.get(context).changeName(
                          name: nameController.text,
                          token: UserCubit.get(context).user!.token!);
                    }
                    CashHelper.putString(
                        key: Keys.bio,
                        value: bioController.text.isNotEmpty
                            ? bioController.text
                            : CashHelper.getString(key: Keys.bio));

                    CashHelper.putString(
                        key: Keys.address,
                        value: addressController.text.isNotEmpty
                            ? addressController.text
                            : CashHelper.getString(key: Keys.address));

                    CashHelper.putString(
                        key: Keys.phone,
                        value: phoneController.text.isNotEmpty
                            ? phoneController.text
                            : CashHelper.getString(key: Keys.phone));
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
