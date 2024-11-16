import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

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
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void cancelEditing() {
    readOnly = true;
  }

  void _presenetDatePicker() async {
    final date = DateTime.now();
    final firstDate = DateTime(date.year - 1, date.month);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: date);

    setState(() {
      _selectedDate = pickedDate;
    });
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  readOnly: readOnly,
                  controller: _numberController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                      prefixText: '\$ ', label: Text('Amount')),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? 'no selected date'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _presenetDatePicker,
                        icon: const Icon(Icons.date_range))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
            value: _selectedCategory,
              items: Category.values
                  .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase())))
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
                
              }),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    _submitExpenseDate();
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
  
  void _submitExpenseDate() {
    final enteredAmount = double.tryParse(_numberController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <=0 ; 
    if(isAmountInvalid || _textController.text.trim().isEmpty || _selectedDate == null){
      
    }
  }
}
