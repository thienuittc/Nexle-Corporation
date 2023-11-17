import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexle_corporation/core/dto/users/user_dto.dart';
import 'package:nexle_corporation/core/utils/validate_utils.dart';
import 'package:nexle_corporation/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:nexle_corporation/ui/common_widgets/background.dart';
import 'package:nexle_corporation/ui/common_widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/text_style_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late IAuthViewModel _iAuthViewModel;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  @override
  void initState() {
    _iAuthViewModel = context.read<IAuthViewModel>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    Future.delayed(Duration.zero, () async {
      await _iAuthViewModel.init();
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(
          imagePath: 'assets/images/image 139.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250.h,
                  ),
                  Text(
                    "Let’s get you started!",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextField(
                          onChanged: (p0) {
                            setState(() {});
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Your email',
                          labelStyle: TextStyleUtils.subHeading,
                          validator: (value) {
                            return ValidateUtils.validateEmail(value!);
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextField(
                          onChanged: (p0) {
                            setState(() {});
                          },
                          obscureText: _hidePassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },
                            icon: _hidePassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          label: 'Your password',
                          validator: (value) {
                            return ValidateUtils.validatePassword(value!);
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            ValidateUtils.evaluatePasswordStrength(
                                passwordController.text),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        checkColor: Colors.white,
                      ),
                      Text(
                        "I am over 16 years of age",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "By clicking Sign Up, you are indicating that you have read and agree to the Terms of Service and Privacy Policy",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await _iAuthViewModel.signUp(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                        child: Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 60.r,
                          color: _formKey.currentState?.validate() == true
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
