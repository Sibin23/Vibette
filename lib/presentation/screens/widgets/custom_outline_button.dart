import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/colors.dart';

class CustomOutlineButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  final Size size;
  final Color? textColor;
  const CustomOutlineButton({
    super.key,
    required this.size,
    this.textColor,
    required this.text,
    required this.onTap,
  });
  @override

  // ignore: library_private_types_in_public_api
  _CustomOutlineButtonState createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  double _animatedWidth = 0.0;
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.size.width,
      child: Stack(
        children: [
          if (!isHover)
            Container(
              height: 52,
              width: widget.size.width * 0.2,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? white
                        : black),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 52,
            width: _animatedWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: appThemeColor2),
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                isHover = !isHover;
                _animatedWidth = value ? widget.size.width * 0.2 : 0.0;
              });
            },
            onTap: () {
              widget.onTap();
            },
            child: SizedBox(
              height: 52,
              width: widget.size.width * 0.2,
              child: Center(
                child: Text(
                  widget.text.toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? white
                          : black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
