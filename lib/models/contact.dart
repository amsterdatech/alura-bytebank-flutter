class Contact {
  final int? id;
  final String name;
  final int accountNumber;

  Contact(this.name, this.accountNumber,[this.id]);

  @override
  String toString() {
    return 'Contact{id: $id, name:$name, accountNumber:$accountNumber} ';
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'accountNumber': accountNumber};
  }
}
