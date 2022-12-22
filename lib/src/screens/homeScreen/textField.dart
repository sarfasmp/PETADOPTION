import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonTextField(
    {required BuildContext context,
    String? label,
    String? hint,
    double radius = 30,
    String? prefixText,
    Icon? icon,
    Color borderColor = Colors.white,
    Widget? suffixIcon,
    bool readOnly = false,
    TextInputType? type,
    TextEditingController? controller,
    Function()? onTap,
    Function(String)? onChanged,
      Key? key
    }) {
  return TextFormField(
    key: key,
      style: GoogleFonts.poppins(),
      readOnly: readOnly,
      controller: controller,
      keyboardType: type,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        isDense: true,
        errorMaxLines: 2,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xffEAEAEA),
            radius: 15,
            child: icon,
          ),
        ),
        fillColor: Theme.of(context).cardColor,
        filled: true,
        //suffix: suffixIcon,

        suffixIcon: suffixIcon,
        hintText: hint,
        labelStyle: const TextStyle(color: Color(0xff292D32)),
        label: label != null ? Text(label) : null,
        prefixText: prefixText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Theme.of(context).indicatorColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color:Theme.of(context).indicatorColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Theme.of(context).indicatorColor),
        ),
        errorBorder: const OutlineInputBorder(),
      ));
}
