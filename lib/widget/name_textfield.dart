import 'package:flutter/material.dart';
import 'package:walmart/widget/validator.dart';

class NameTextFormWidget extends StatefulWidget {
  final TextEditingController? nameController;

  const NameTextFormWidget({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  @override
  State<NameTextFormWidget> createState() => NameTextFormWidgetState();
}

class NameTextFormWidgetState extends State<NameTextFormWidget> {
  late TextEditingController nameController;

  @override
  void initState() {
    nameController = widget.nameController ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (name) {
        return StatementValidator.validateName(name: name);
      },
      textAlign: TextAlign.start,
      controller: widget.nameController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide()),
          labelText: 'name',
          labelStyle: const TextStyle(
            fontSize: 16,
          )),
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
    );
  }
}
