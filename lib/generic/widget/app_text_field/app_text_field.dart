import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../library/app.dart';
import 'validator.dart';

class AppTextField extends StatelessWidget {
  final List<Validator> validators;
  final TextEntryModel model;
  final TextField _textField;
  final Function(AppTextField)? beginEdit;
  final Function(AppTextField)? endEdit;
  final ValueChanged<String>? onChanged;

  AppTextField(
    this.model, {
    Key? key,
    Widget? suffixWidget,
    TextAlign textAlign = TextAlign.start,
    String hint = '',
    String? label,
    bool secure = false,
    int lines = 1,
    this.onChanged,
    this.beginEdit,
    this.endEdit,
    this.validators = const [],
    TextInputType keyboardType = TextInputType.text,
    bool enabled = true,
    bool editable = true,
    bool autofocus = false,
    Color? cursorColor,
    Color? filled,
  })  : _textField = TextField(
          obscureText: secure,
          focusNode: model.focusNode,
          autocorrect: false,
          keyboardType: keyboardType,
          textAlign: textAlign,
          maxLines: lines,
          enabled: enabled && editable,
          controller: model.controller,
          onChanged: (text) {
            onChanged?.call(text);
          },
          autofocus: autofocus,
          style: App.appTheme.textTitle,
          cursorColor: cursorColor ?? App.appTheme.colorPrimary,
          cursorWidth: 1,
          decoration: InputDecoration(
            suffixIcon: suffixWidget,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 32,
              minWidth: 32,
            ),
            filled: filled != null,
            isDense: false,
            errorText: model.error?.tr(),
            fillColor: filled ?? App.appTheme.colorBackground1,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: App.appTheme.colorPrimary, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: App.appTheme.colorPrimary, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: App.appTheme.colorInactive, width: 1),
            ),
            hintText: hint,
            hintStyle: App.appTheme.textTitle.copyWith(color: App.appTheme.colorTextSecondary),
            labelText: label,
            labelStyle: App.appTheme.textTitle.copyWith(color: App.appTheme.colorTextSecondary),
          ),
        ),
        super(key: key) {
    model.validators = validators;
    _initFocus();
  }

  void _initFocus() {
    // ignore: invalid_use_of_protected_member
    if (!model.focusNode.hasListeners) {
      model.focusNode.addListener(() {
        if (!model.focusNode.hasFocus) {
          endEdit?.call(this);
        } else {
          beginEdit?.call(this);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _textField;
  }
}

class TextEntryModel {
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller;
  String? error;
  List<Validator> validators = [];

  TextEntryModel({String text = ''}) : controller = TextEditingController(text: text);

  String get text => controller.text;

  void initText(String text) {
    if (controller.text.isEmpty) {
      controller.text = text;
    }
  }

  Future<ValidatorResult> validate() async {
    error = null;
    if (validators == null || validators.isEmpty) {
      return ValidatorResult(true, null);
    }

    bool isValid = true;
    String? hasError;

    for (final Validator validator in validators) {
      final ValidatorResult result = await validator.validate(<ValidableParam, dynamic>{ValidableParam.text: controller.text});
      if (!result.valid) {
        isValid = isValid && result.valid;
        hasError = hasError ?? result.error;
      }
    }
    error = hasError;
    return ValidatorResult(isValid, hasError);
  }

  static Future<bool> validateFields(List<TextEntryModel> fields) async {
    bool isValid = true;

    for (final TextEntryModel model in fields) {
      if (model != null) {
        final ValidatorResult result = await model.validate();
        isValid = isValid && result.valid;
      }
    }

    return isValid;
  }
}
