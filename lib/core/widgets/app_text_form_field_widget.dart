import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/palette.dart';

typedef OnChanged(String value);
typedef String? OnValidate(String? value);

class AppTextFormFieldwidget extends StatefulWidget {
  final String? title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType inputType;
  final int minLines;
  final Color backgroundColor;
  final Color fousBackgroundColor;
  final bool obscureText;
  final String? placeholder;
  final OnChanged? onChanged;
  final OnValidate? onValidate;
  final String? initialValue;
  final bool autoFocus;
  final BorderRadius borderRadius;
  final int? maxLine;
  final TextEditingController? controller;
  const AppTextFormFieldwidget({
    this.title,
    this.suffixIcon,
    this.onChanged,
    this.prefixIcon,
    this.onValidate,
    this.placeholder,
    this.inputType = TextInputType.text,
    this.minLines = 1,
    this.backgroundColor = Palette.input_bg,
    this.fousBackgroundColor = Colors.white,
    this.obscureText = false,
    this.maxLine = 1,
    this.initialValue,
    this.autoFocus = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    this.controller,
  });

  @override
  _AppTextFormFieldwidget createState() => _AppTextFormFieldwidget();
}

class _AppTextFormFieldwidget extends State<AppTextFormFieldwidget> {
  late bool isFocus;
  final _focusNode = FocusNode();
  late String _currentText;
  late TextEditingController _controller;
  @override
  void initState() {
    print(widget.borderRadius);
    _currentText = "";
    _controller = widget.controller ?? new TextEditingController();

    _controller.addListener(() {
      setState(() {
        _currentText = _controller.value.text;
      });
    });

    if (widget.initialValue != null) _controller.text = widget.initialValue!;

    this.isFocus = false;
    _focusNode.addListener(() {
      setState(() {
        this.isFocus = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: const TextStyle(
              color: Color(0xff757575),
            ),
          ),
          const SizedBox(height: 3.0),
        ],
        TextFormField(
          autofocus: widget.autoFocus,
          focusNode: _focusNode,
          // obscuringCharacter: "*",
          obscureText: widget.obscureText,
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          keyboardType: widget.inputType,
          minLines: widget.minLines,
          maxLines: widget.maxLine,
          controller: _controller,

          decoration: InputDecoration(
            // errorText: ,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: widget.prefixIcon,
            ),

            prefixIconConstraints: BoxConstraints(maxHeight: 32, maxWidth: 32),
            labelText: widget.placeholder,
            labelStyle: TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: widget.suffixIcon == null
                ? null
                : !this.isFocus || _currentText.length == 0
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: widget.suffixIcon,
                      )
                    : _buildClearTextButton(),
            suffixIconConstraints: widget.suffixIcon != null
                ? BoxConstraints(maxHeight: 25.0)
                : null,
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(widget.borderRadius),
            // ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: const Color(0xffeeeeee),
              ),
              borderRadius: widget.borderRadius,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Palette.fourthColor,
              ),
              borderRadius: widget.borderRadius,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.backgroundColor,
              ),
              borderRadius: widget.borderRadius,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Palette.fourthColor,
              ),
              borderRadius: widget.borderRadius,
            ),
            filled: true,
            fillColor: this.isFocus
                ? widget.fousBackgroundColor
                : widget.backgroundColor,
          ),
          autocorrect: false,
          style: const TextStyle(fontSize: 16.0),
          onChanged: widget.onChanged,
          validator: widget.onValidate,
        ),
      ],
    );
  }

  IconButton _buildClearTextButton() {
    return IconButton(
      padding: const EdgeInsets.only(right: 0),
      onPressed: () => _controller.clear(),
      color: const Color(0xff9e9e9e),
      icon: const Icon(
        Icons.close,
        size: 25.0,
      ),
    );
  }
}
