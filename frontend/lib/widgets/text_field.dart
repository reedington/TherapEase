import '../../utils/utils.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final bool? enabled;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final String? hintText;
  final String? titleText;
  final Widget? suffixIcon;
  final Widget? titleRight;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextInput({
    super.key,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.maxLength,
    this.minLines,
    this.expands = false,
    this.enabled,
    this.onChanged,
    this.fillColor,
    this.titleRight,
    this.controller,
    this.onEditingComplete,
    this.hintStyle,
    this.onSubmitted,
    this.onTap,
    this.hintText,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.prefixIcon,
    this.validator,
    this.titleText,
    this.style,
    this.autovalidateMode,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      controller: controller,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      readOnly: onTap != null ? true : readOnly,
      autofocus: autofocus,
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      autovalidateMode: autovalidateMode,
      onFieldSubmitted: onSubmitted,
      enabled: enabled,
      validator: validator,
      style: TextStyle(
        color: AppColor.gray100,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
      cursorColor: AppColor.gray100,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 15.w,
        ),
        fillColor: fillColor ?? AppColor.gray50,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              color: AppColor.gray300,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColor.gray200,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColor.gray200,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColor.gray200,
            width: 1,
          ),
        ),
      ),
    );
  }
}
