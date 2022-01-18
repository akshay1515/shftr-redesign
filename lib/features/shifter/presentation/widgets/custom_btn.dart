import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool? outlineBtn;
  final bool? isLoading;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final bool? isIcon;
    const CustomBtn({Key? key, this.text, this.color, this.icon, this.isIcon, this.textColor, this.onPressed, this.outlineBtn, this.isLoading,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn ?? false;
    bool _isLoading = isLoading ?? false;
    bool _isIcon = isIcon ?? false;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 52.0,
        width: MediaQuery.of(context).size.width/ 1.24,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : color,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 8.0,
        ),
        child: Stack(
          children: [
            Visibility(
              visible: _isLoading ? false : true,
              child: Center(
                child: Text(
                  text ?? "Text",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: _outlineBtn ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isLoading,
              child: const Center(
                child: SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}