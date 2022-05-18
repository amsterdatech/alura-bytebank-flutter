import 'package:flutter/material.dart';

import 'contacts/contacts_list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                 DashboardItem(
                  label: 'Contacts',
                  iconData: Icons.people,
                  onClick: () {
                    _showContactList(context);
                  },
                ),

                 DashboardItem(
                  label: 'Transfer',
                  iconData: Icons.monetization_on,
                   onClick: (){

                   },
                ),

                 DashboardItem(
                  label: 'Transaction Feed',
                  iconData: Icons.description,
                   onClick: (){

                   },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showContactList(BuildContext context) {
         Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactList(),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function onClick;

  const DashboardItem({Key? key, required this.label, required this.iconData, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
