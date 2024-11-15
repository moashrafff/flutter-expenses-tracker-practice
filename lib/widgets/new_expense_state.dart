import 'package:flutter/material.dart';

class NewExpenseState extends StatefulWidget {
  const NewExpenseState({super.key});

  @override
  State<NewExpenseState> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpenseState> {
  final _textController = TextEditingController();
  final _numberController = TextEditingController();
  var readOnly = false;


  void cancelEditing(){
    readOnly = true;
  }

  @override
  void dispose() {
    _textController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            readOnly: readOnly,
            controller: _textController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextField(
            keyboardType: TextInputType.number,
            readOnly: readOnly,
            controller: _numberController,
            maxLength: 50,
            decoration: const InputDecoration(prefixText: '\$ ',label: Text('Amount')),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_textController.text);
                  },
                  child: const Text('Save Input')),
                  TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),

            ],
          )
        ],
      ),
    );
  }
}
