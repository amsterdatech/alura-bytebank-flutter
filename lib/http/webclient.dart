import 'package:http/http.dart';

void findAll() async {
  String url = Uri.http('192.168.1.9:8080', 'transactions').toString();
  print(url);
  final Response response = await get(Uri.http('192.168.1.9:8080', 'transactions'));
  print(response.body);
}
