import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  final void Function(String value)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final bool heightExpanded;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final bool? isCollapsed;
  final bool? isDense;
  const TextFieldWidget(
      {Key? key,
      this.textEditingController,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.obscureText = false,
      this.onChanged,
      this.textInputAction,
      this.keyboardType,
      this.inputFormatters,
      this.maxLength,
      this.textCapitalization = TextCapitalization.none,
      this.heightExpanded = true,
      this.autovalidateMode,
      this.focusNode,
      this.isCollapsed,
      this.isDense})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isVisiblePassword = false;
  @override
  void initState() {
    setState(() {
      isVisiblePassword = widget.obscureText;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.redAccent,
            ),
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        autovalidateMode: widget.autovalidateMode,
        textCapitalization: widget.textCapitalization!,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        controller: widget.textEditingController,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
          fontWeight: FontWeight.w400,
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          isDense: widget.isDense,
          isCollapsed: widget.isCollapsed,
          //contentPadding: EdgeInsetsDirectional.zero,
          focusColor: Colors.white,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon != null
              ? widget.suffixIcon!
              : widget.obscureText
                  ? InkWell(
                      onTap: () => setState(() {
                        isVisiblePassword = !isVisiblePassword;
                      }),
                      child: Icon(
                        !isVisiblePassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye_rounded,
                      ),
                    )
                  : null,
          //suffixStyle: const TextStyle(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        obscureText: isVisiblePassword,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
