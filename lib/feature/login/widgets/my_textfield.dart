
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.labelName,
    this.borderColor,
    this.borderRadius,
    this.validator,
    this.onChanged,
    this.maxLine,
    this.textController,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon
  });

  final String? labelName;
  final Color? borderColor;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLine;
  final TextEditingController? textController;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,

      maxLength: maxLine ?? 200, // kati ota letter samma lekhne vanda
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            borderSide: BorderSide(
              color: borderColor?? Colors.black,
            )
        ),
        /*  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2
                      )
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,

                      ),
                      borderRadius: BorderRadius.circular(21),
                    ),*/

        label:Text(labelName ?? ''),

      ),
      onChanged: onChanged,
      validator:validator,
      obscureText: obscureText ?? false,

    );
  }
}
