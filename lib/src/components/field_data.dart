// Copyright (c) 2025. Alexandr Moroz

class MTFieldData {
  const MTFieldData(
    this.code, {
    this.text = '',
    this.label = '',
    this.placeholder = '',
    this.helper,
    this.validator,
    this.validate = false,
    this.noText = false,
    this.loading = false,
    this.edited = false,
  });

  final int code;
  final String label;
  final String placeholder;
  final String? helper;
  final String? Function(String)? validator;
  final bool validate;
  final bool noText;

  final bool loading;
  final String text;
  final bool edited;

  MTFieldData copyWith({String? text, bool? loading}) => MTFieldData(
        code,
        text: text ?? this.text,
        loading: loading ?? this.loading,
        label: label,
        placeholder: placeholder,
        helper: helper,
        validator: validator,
        validate: validate,
        noText: noText,
        edited: true,
      );

  @override
  String toString() => text;

  String? emptyValidator(String text) {
    return text.trim().isEmpty ? 'Field cannot be empty' : null;
  }

  String? get errorText {
    if (!edited || !validate) {
      return null;
    }

    return validator != null ? validator!(text) : emptyValidator(text);
  }
}
