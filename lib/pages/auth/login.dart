import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_filed.dart';
import '../../helper/dimensions.dart';
import '../../helper/responsive_helper.dart';
import '../../helper/styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode _phoneFocus = FocusNode();
    final FocusNode _passwordFocus = FocusNode();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    String? _countryDialCode;
    return Scaffold(
        body: SafeArea(
            child: Scrollbar(
                child: Center(
                    child: Container(
                        width: context.width > 700 ? 500 : context.width,
                        padding: context.width > 700
                            ? const EdgeInsets.all(50)
                            : const EdgeInsets.all(
                                Dimensions.paddingSizeExtremeLarge),
                        margin: context.width > 700
                            ? const EdgeInsets.all(
                                Dimensions.paddingSizeDefault)
                            : EdgeInsets.zero,
                        decoration: context.width > 700
                            ? BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusSmall),
                                boxShadow: ResponsiveHelper.isDesktop(context)
                                    ? null
                                    : [
                                        BoxShadow(
                                            color: Colors.grey[
                                                Get.isDarkMode ? 700 : 300]!,
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                              )
                            : null,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ResponsiveHelper.isDesktop(context)
                                      ? Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                            onPressed: () => Get.back(),
                                            icon: const Icon(Icons.clear),
                                          ),
                                        )
                                      : const SizedBox(),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeExtraLarge),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('sign_in'.tr,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeDefault),
                                  CustomTextField(
                                      titleText:
                                          ResponsiveHelper.isDesktop(context)
                                              ? 'phone'.tr
                                              : 'enter_phone_number'.tr,
                                      hintText: ' ',
                                      controller: _phoneController,
                                      focusNode: _phoneFocus,
                                      nextFocus: _passwordFocus,
                                      inputType: TextInputType.phone,
                                      isPhone: true,
                                      onCountryChanged:
                                          (CountryCode countryCode) {
                                        _countryDialCode = countryCode.dialCode;
                                      },
                                      countryDialCode: _countryDialCode),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeExtraLarge),
                                  CustomTextField(
                                      titleText:
                                          ResponsiveHelper.isDesktop(context)
                                              ? 'password'.tr
                                              : 'enter_your_password'.tr,
                                      hintText: 'enter_your_password'.tr,
                                      controller: _passwordController,
                                      focusNode: _passwordFocus,
                                      inputAction: TextInputAction.done,
                                      inputType: TextInputType.visiblePassword,
                                      prefixIcon: Icons.lock,
                                      isPassword: true,
                                      showTitle:
                                          ResponsiveHelper.isDesktop(context),
                                      onSubmit: (text) => (GetPlatform.isWeb)),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeDefault),
                                  Row(children: [
                                    Expanded(
                                      child: ListTile(
                                        leading: Checkbox(
                                            visualDensity: const VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                            value: false,
                                            onChanged: (s) {}),
                                        title: Text('remember_me'.tr),
                                        contentPadding: EdgeInsets.zero,
                                        visualDensity: const VisualDensity(
                                            horizontal: 0, vertical: -4),
                                        dense: true,
                                        horizontalTitleGap: 0,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('${'forgot_password'.tr}?',
                                          style: robotoMedium.copyWith(
                                              color:
                                                  Theme.of(context).hintColor)),
                                    ),
                                  ]),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeLarge),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeDefault),
                                  CustomButton(
                                    buttonText: 'sign_in'.tr,
                                    onPressed: () {},
                                    isLoading: false,
                                  ),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeExtraLarge),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('do_not_have_account'.tr,
                                            style: robotoRegular.copyWith(
                                                color: Theme.of(context)
                                                    .hintColor)),
                                        InkWell(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                Dimensions
                                                    .paddingSizeExtraSmall),
                                            child: Text('sign_up'.tr,
                                                style: robotoMedium.copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeSmall),
                                ]),
                          ),
                        ))))));
  }
}
