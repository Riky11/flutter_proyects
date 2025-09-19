import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpese extends StatefulWidget {
  const NewExpese({super.key});

  @override
  State<NewExpese> createState() {
    return _NewExpeseState();
  }
}

class _NewExpeseState extends State<NewExpese> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  
  void _presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Tile')),
          ),
          Row(children: [            
            Expanded(
              child: TextField(
                controller: _amountController,
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text('Aomunt'),
                  prefixText: '\$ ',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Selected Date'),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: Icon(Icons.calendar_month)
                  )
                ],
              ),
            ),
          ],),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: Text('Cancel')
              ),
              SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  print('Title: ${_titleController.text}');
                  print('Amount: ${_amountController.text}');
                },
                child: Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
