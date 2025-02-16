import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/presentation/bloc/cubit/password_cubit/password_visibility_cubit.dart';

class TextFieldAuthentication extends StatelessWidget {
  const TextFieldAuthentication(
      {super.key,
      this.prefixIcon,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.keyboardType});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      cursorWidth: 2,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style:
          GoogleFonts.roboto(fontSize: 20, color: textfieldTextTheme(context)),
      decoration: InputDecoration(
        filled: true,
        fillColor: textfieldTheme(context),
        prefixIcon: Icon(
          prefixIcon,
        ),
        prefixIconColor: textfieldTextTheme(context),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(15),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          fontSize: 20,
          color: textfieldTextTheme(context),
        ),
      ),
      validator: validator,
    );
  }
}

class PasswordAuthentication extends StatelessWidget {
  const PasswordAuthentication(
      {super.key,
      this.prefixIcon,
      this.voidCallback,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.keyboardType});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  final VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
      builder: (context, state) {
        return TextFormField(
          
          obscureText: state.isObscured,
          cursorWidth: 2,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: GoogleFonts.roboto(
              fontSize: 20, color: textfieldTextTheme(context)),
          decoration: InputDecoration(
              filled: true,
              fillColor: textfieldTheme(context),
              prefixIcon: Icon(
                prefixIcon,
              ),
              prefixIconColor: textfieldTextTheme(context),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.all(15),
              hintText: hintText,
              hintStyle: GoogleFonts.roboto(
                fontSize: 20,
                color: textfieldTextTheme(context),
              ),
              suffixIcon: IconButton(
                onPressed: voidCallback,
                icon: Icon(
                    state.isObscured ? Icons.visibility : Icons.visibility_off),
              ),
              counterStyle: GoogleFonts.roboto(color: Colors.red)),
          validator: validator,
        );
      },
    );
  }
}

class ConfirmPasswordAuthentication extends StatelessWidget {
  const ConfirmPasswordAuthentication(
      {super.key,
      this.prefixIcon,
      this.voidCallback,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.keyboardType});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  final VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmPasswordVisibilityCubit,
        ConfirmPasswordVisibilityState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.isObscured,
          cursorWidth: 2,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: GoogleFonts.roboto(
              fontSize: 20, color: textfieldTextTheme(context)),
          decoration: InputDecoration(
              filled: true,
              fillColor: textfieldTheme(context),
              prefixIcon: Icon(
                prefixIcon,
              ),
              prefixIconColor: textfieldTextTheme(context),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.all(15),
              hintText: hintText,
              hintStyle: GoogleFonts.roboto(
                fontSize: 20,
                color: textfieldTextTheme(context),
              ),
              suffixIcon: IconButton(
                onPressed: voidCallback,
                icon: Icon(
                    state.isObscured ? Icons.visibility : Icons.visibility_off),
              ),
              counterStyle: GoogleFonts.roboto(color: Colors.red)),
          validator: validator,
        );
      },
    );
  }
}
