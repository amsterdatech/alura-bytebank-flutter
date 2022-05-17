import 'package:flutter/material.dart';

import '../../database/app_database.dart';
import '../../models/contact.dart';
import '../contacts/contact_form.dart';


class ContactList extends StatelessWidget {
  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        body: FutureBuilder<List<Contact>>(
          future: findAll(),
          builder: (context, snapshot) {
            final List<Contact>? contacts = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Contact contact = contacts![index];
                return _ContactItem(contact);
              },
              itemCount: contacts?.length ?? 0,
            );
          },),
        floatingActionButton: FloatingActionButton(
        onPressed: ()
    {
      Navigator.of(context)
          .push(
        MaterialPageRoute(
          builder: (context) => ContactForm(),
        ),
      )
          .then((newContact) => debugPrint(newContact.toString()));
    },
    child: Icon(Icons.add),
    ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
