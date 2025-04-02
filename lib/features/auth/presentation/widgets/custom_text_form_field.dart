import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final double width;
  final double height;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.isPassword = false,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = Colors.white,
    this.width = double.infinity,
    this.height = 60.0,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          filled: true,
          fillColor: widget.backgroundColor,
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                  : null,
        ),
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
