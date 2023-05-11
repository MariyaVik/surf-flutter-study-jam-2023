import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../domain/box_manager.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              cursorColor: AppColor.greyMedium,
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Введите URL',
              ),
              onChanged: (value) {},
              validator: (value) {
                var urlPattern = r"(https?|http)://([a-zA-Z0-9_/\.-]*)\.pdf";
                if (value == null || value.isEmpty) {
                  return 'Поле обязательно для заполнения';
                } else if (!RegExp(urlPattern).hasMatch(value)) {
                  return 'Введите корректный URL';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ссылка добавлена')),
                  );
                  BoxManager().addTicket(_controller);
                }
              },
              child: const Text('Добавить'))
        ],
      ),
    );
  }
}
