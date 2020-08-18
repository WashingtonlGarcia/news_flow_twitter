import "package:flutter/material.dart";

import "button_icon_widget.dart";

class InputSearchWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function submitForm;
  final String Function(String value) validator;
  final String hintText;
  final bool autoFocus;
  final dynamic onFieldSubmitted;

  const InputSearchWidget({
    @required this.textEditingController,
    @required this.submitForm,
    @required this.textInputAction,
    @required this.keyboardType,
    @required this.focusNode,
    @required this.validator,
    @required this.hintText,
    @required this.onFieldSubmitted,
    this.autoFocus = true,
  });

  @override
  _InputSearchWidgetState createState() => _InputSearchWidgetState();
}

class _InputSearchWidgetState extends State<InputSearchWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;

/*  bool _isLoading = false;*/
// todo arrumar botao
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Row(
        children: <Widget>[
          Flexible(
              child: TextFormField(
            textAlign: TextAlign.left,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            autofocus: widget.autoFocus,
            onFieldSubmitted: widget.onFieldSubmitted is FocusNode
                ? (String value) {
                    if (Focus.of(context).hasFocus) Focus.of(context).unfocus();
                    Focus.of(context)
                        .requestFocus(widget.onFieldSubmitted as FocusNode);
                  }
                : (String value) {
                    _autoValidate = true;
                    if (_formKey.currentState.validate()) {
                      widget.submitForm();
                      _autoValidate = false;
                      Focus.of(context).unfocus();
                    }
                  },
            textInputAction: widget.textInputAction,
            controller: widget.textEditingController,
            focusNode: widget.focusNode,
            decoration: InputDecoration(
                errorStyle: const TextStyle(height: 0),
                hintText: widget.hintText,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
          )),
          ButtonIconWidget(
            onTap: () {
              Focus.of(context).unfocus();
              widget.submitForm();

            },
            icon: Icons.search,
          ),
        ],
      ),
    );
  }
}
