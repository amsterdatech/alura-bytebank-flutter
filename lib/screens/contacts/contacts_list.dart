import 'package:flutter/material.dart';

import '../../database/contact_dao.dart';
import '../../models/contact.dart';
import '../contacts/contact_form.dart';
import '../transferencia/transaction_form.dart';

class ContactList extends StatefulWidget {
  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          final List<Contact>? contacts = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              final Contact contact = contacts![index];
              return _ContactItem(
                  contact: contact,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TransactionForm(contact),
                      ),
                    );
                  });
            },
            itemCount: contacts?.length ?? 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then((newContact) => debugPrint(newContact.toString()))
              .then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  _ContactItem({required this.contact, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
