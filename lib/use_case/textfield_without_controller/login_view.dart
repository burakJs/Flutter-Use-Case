import 'package:flutter/material.dart';
import 'package:flutter_use_case/use_case/textfield_without_controller/clear_action.dart';

mixin LoginController on State<LoginView> {
  late final ClearTextAction _clearTextAction;
  late final ControllerCleaner _controllerCleaner;
  @override
  void initState() {
    super.initState();
    _clearTextAction = ClearTextAction();
    _controllerCleaner = ControllerCleaner(_clearTextAction);
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginController {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _homeButton(),
          _removeButton(),
        ],
      ),
      body: _CustomTextField(
        action: _clearTextAction,
        onChange: (String value) {
          _value = value;
        },
      ),
    );
  }

  FloatingActionButton _homeButton() {
    return FloatingActionButton.large(
      child: const Icon(Icons.home),
      onPressed: () {
        _controllerCleaner.update('Home');
      },
    );
  }

  FloatingActionButton _removeButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () {
        _controllerCleaner.clear();
      },
    );
  }
}

class _CustomTextField extends StatelessWidget {
  _CustomTextField({required this.action, required this.onChange});

  final TextEditingController _textEditingController = TextEditingController();
  final ClearTextAction action;
  final void Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return ActionListener(
      action: action,
      listener: (action) {
        if (action is ClearTextAction) {
          if (action.text.isEmpty) {
            _textEditingController.clear();
          } else {
            _textEditingController.text = action.text;
            _textEditingController.selection = TextSelection.collapsed(
              offset: _textEditingController.text.length,
            );
          }
        }
      },
      child: TextField(
        onChanged: onChange,
        controller: _textEditingController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ControllerCleaner {
  ControllerCleaner(ClearTextAction clearTextAction) : _clearTextAction = clearTextAction;

  final ClearTextAction _clearTextAction;

  void clear() {
    _clearTextAction.invoke(const ClearTextIntent());
  }

  void update(String title) {
    _clearTextAction.invoke(ClearTextIntent(text: title));
  }
}
