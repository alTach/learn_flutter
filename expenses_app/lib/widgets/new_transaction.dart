import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
//                    onChanged: (val) => {this.titleInput = val},
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
//                    onChanged: (val) => {this.amountInput = val},
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add transaction'),
              textColor: Colors.purple,
              onPressed: () => {
                addTx(titleController.text, double.parse(amountController.text))
              },
            )
          ],
        ),
      ),
    );
  }
}
