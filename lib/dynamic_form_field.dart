import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './dynamic_mobile_widgets.dart';

/// ## Both Android and IOS
/// ---
/// **FormField's documentation:**<br>
/// ---
/// **Cupertino's CupertinoTextFormField's documentation:**<br>

/// Returns a form field Widget depending on this user's devices' operating system.
class DynamicFormField extends DynamicStatefulWidget {
  final String labelText;
  final bool obscureText;
  final List<TextInputFormatter>? textInputFormatter;
  final InputDecoration? decoration;
  final Function validator;
  final Function saveField;
  final TextEditingController textEditingController = TextEditingController();

  DynamicFormField({
    Key? key,
    required this.labelText,
    this.obscureText = false,
    this.textInputFormatter,
    this.decoration,
    Function? validator,
    Function? saveField,
  })  : validator = validator ?? (() {}),
        saveField = saveField ?? (() {}),
        assert(labelText != ""),
        super(key: key);

  @override
  DynamicFormFieldState createState() => DynamicFormFieldState();
}

class DynamicFormFieldState extends DynamicState<DynamicFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: platform
          ? TextFormField(
              controller: widget.textEditingController,
              // If text should be hidden as it's typed.
              obscureText: widget.obscureText,
              // Ensures the correct format is used from this user in these fields.
              inputFormatters: widget.textInputFormatter,
              // Label for the form field.
              decoration: InputDecoration(
                label: Text(
                  widget.labelText,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              // Ensures an empty value can't be submitted.
              validator: (String? textValue) {
                return widget.validator(textValue, widget.labelText);
              },
              // Saves the form to memory on a change.
              onChanged: (String? textValue) async {
                return await widget.saveField(textValue, widget.labelText);
                // await widget.saveField(textValue, labelText);
              },
              // Saves the form to memory on a save.
              onSaved: (String? textValue) async {
                return await widget.saveField(textValue, widget.labelText);
                // await widget.saveField(textValue, labelText);
              },
              // Saves the form to memory on a submit.
              onFieldSubmitted: (String? textValue) async {
                return await widget.saveField(textValue, widget.labelText);
                // await widget.saveField(textValue, labelText);
              },
            )
          : CupertinoTextFormFieldRow(
              controller: widget.textEditingController,
              // If text should be hidden as it's typed.
              obscureText: widget.obscureText,
              // Ensures the correct format is used from this user in these fields.
              inputFormatters: widget.textInputFormatter,
              // Label for the form field.
              prefix: Text(
                widget.labelText,
                style: Theme.of(context).textTheme.headline6,
              ),
              // Ensures an empty value can't be submitted.
              validator: (String? textValue) {
                return widget.validator(textValue, widget.labelText);
              },
              // Saves the form to memory on a change.
              onChanged: (String? textValue) async {
                return await widget.saveField(textValue, widget.labelText);
                // await widget.saveField(textValue, labelText);
              },
              // Saves the form to memory on a save.
              onSaved: (String? textValue) async {
                return await widget.saveField(textValue, widget.labelText);
                // await widget.saveField(textValue, labelText);
              },
              // Saves the form to memory on a submit.
              onFieldSubmitted: (String? textValue) async {
                return await widget.saveField(textValue, widget.labelText);
                // await widget.saveField(textValue, labelText);
              },
            ),
    );
  }
}
