import 'package:bytebank/http/http_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

void findAll() async {
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client.get(Uri.http('192.168.1.9:8080', 'transactions'));
}
