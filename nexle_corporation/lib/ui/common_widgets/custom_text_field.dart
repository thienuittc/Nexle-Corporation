import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexle_corporation/core/utils/text_style_utils.dart';

enum PasswordStrength { Weak, Fair, Good, Strong }

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.label,
    this.placeholder,
    this.isRequired = false,
    this.maxLines = 1,
    this.initialValue,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
    required this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLength,
    this.onTap,
    this.suffixIcon,
    this.isFocus = false,
    this.placeholderSize = 8,
    this.fontSize = 14,
    this.hasOutline = true,
    this.labelSpacing = 3,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.preffixIcon,
    this.borderRadius,
    this.filled,
    this.fillColor,
    this.textColor,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final String? placeholder;
  final bool isRequired;
  final int maxLines;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool readOnly;
  final bool isFocus;
  final bool enabled;
  final int? maxLength;
  final Function()? onTap;
  final Widget? suffixIcon;
  final double placeholderSize;
  final double fontSize;
  final TextStyle? labelStyle;
  final bool hasOutline;
  final double labelSpacing;
  final String? hintText;
  final Widget? preffixIcon;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final bool? filled;
  final Color? fillColor;
  final Color? textColor;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: isRequired == true ? '*' : '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: labelSpacing.h,
        ),
        TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          initialValue: initialValue,
          maxLines: maxLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          focusNode: focusNode,
          obscureText: obscureText,
          readOnly: readOnly,
          enabled: enabled,
          onTap: onTap,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            filled: filled ?? false,
            fillColor: fillColor,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff647fff)),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff647fff)),
            ),
            isDense: true,
            suffixIcon: suffixIcon,
            prefixIcon: preffixIcon,
          ),
        )
      ],
    );
  }
}
