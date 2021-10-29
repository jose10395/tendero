import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiendero/core/cc.dart';

class Textbox extends StatelessWidget {
  final TextEditingController controller;
  final String Function(String) validator;
  final ValueChanged<String> onKeyPress;
  final TextInputType keyboardType;
  final String placeholder;
  final List<TextInputFormatter> inputFormatter;
  final IconData icono;
  final double fontSize;
  final double wordSpacing;
  final TextAlign textAlign;
  final bool autofocus;
  final bool showCursor;
  final FocusNode focusNode;
  final bool disableBorde;
  final bool enabled;
  final EdgeInsetsGeometry padding;
  final bool enableInteractiveSelection;
  final void Function(String) onFieldSubmitted;

  final bool isPassword;
  final bool showPassword;
  final VoidCallback onTapIconPassword;

  Textbox(
      {Key key,
      this.enableInteractiveSelection = false,
      this.controller,
      this.validator,
      this.onKeyPress,
      this.keyboardType,
      this.placeholder,
      this.inputFormatter,
      this.focusNode,
      this.isPassword,
      this.showPassword = false,
      this.onTapIconPassword,
      this.icono,
      this.fontSize,
      this.wordSpacing,
      this.textAlign,
      this.autofocus,
      this.onFieldSubmitted,
      this.disableBorde = false,
      this.enabled = true,
      this.padding,
      this.showCursor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double borderRadius = 50;
    const double fontSizeDefault = 15;

    return TextFormField(
      controller: controller,
      enabled: enabled,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: TextAlignVertical.center,
      textAlign: textAlign == null ? TextAlign.left : textAlign,
      focusNode: focusNode,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontFamily: CFonts.montserrat,
        fontWeight: FontWeight.normal,
        fontSize: fontSize == null ? fontSizeDefault : fontSize,
        wordSpacing: wordSpacing == null ? 1.0 : wordSpacing,
      ),
      autocorrect: false,
      enableSuggestions: false,
      autofocus: autofocus == null ? false : autofocus,
      showCursor: showCursor == null ? true : showCursor,
      keyboardType:
          keyboardType == null ? TextInputType.visiblePassword : keyboardType,
      enableInteractiveSelection: enableInteractiveSelection,
      inputFormatters: inputFormatter == null ? [] : inputFormatter,
      validator: validator,
      onChanged: onKeyPress,
      minLines: 1,
      //PASSWORD
      obscureText: isPassword == null ? false : !showPassword,

      //DISEÑO
      decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: padding ??
              EdgeInsets.symmetric(
                horizontal: (icono == null) ? 25 : 5,
                vertical: 13,
              ),
          hintText: placeholder == null ? '' : placeholder,
          hintMaxLines: 1,
          hintStyle: TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.none,
            fontFamily: CFonts.montserrat,
            fontWeight: FontWeight.normal,
            fontSize: fontSize == null ? fontSizeDefault : fontSize,
            wordSpacing: wordSpacing == null ? 0 : wordSpacing,
          ),
          prefixIcon: icono == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: 48,
                    decoration: const BoxDecoration(
                      color: CColors.blue,
                      borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(borderRadius),
                        bottomLeft: const Radius.circular(borderRadius),
                      ),
                    ),
                    child: Icon(
                      icono,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
          //ICONO PASSWORD
          suffixIcon: isPassword == null
              ? null
              : TextButton(
                  onPressed: onTapIconPassword,
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      CColors.green.withOpacity(0.25),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                  ),
                  child: Icon(
                    showPassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    color: CColors.blue,
                    size: 30,
                  ),
                ),
          //DISEÑO DE CAJA
          focusedBorder: OutlineInputBorder(
            borderSide: disableBorde
                ? BorderSide.none
                : const BorderSide(color: CColors.blue, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: disableBorde
                ? BorderSide.none
                : const BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
          ),
          //DISEÑO DE ERROR
          errorMaxLines: 2,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
          ),
          fillColor: Colors.red,
          focusColor: Colors.red,
          alignLabelWithHint: true),
      //DISEÑO DE CURSOR
      cursorWidth: 2.0,
      cursorHeight: fontSizeDefault + 4,
      cursorColor: CColors.green,
      cursorRadius: const Radius.circular(2.0),
    );
  }
}
