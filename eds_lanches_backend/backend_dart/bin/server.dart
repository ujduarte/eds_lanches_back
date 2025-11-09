import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

void main() async {
  final app = Router();

  final produtos = [
    {'id': 1, 'nome': 'Croissant de Frango', 'preco': 8.90, 'categoria': 'Salgados'},
    {'id': 2, 'nome': 'Esfiha de Calabresa', 'preco': 7.90, 'categoria': 'Salgados'},
    {'id': 3, 'nome': 'Coca-Cola 350ml', 'preco': 4.00, 'categoria': 'Bebidas'},
    {'id': 4, 'nome': 'Fanta 350ml', 'preco': 3.80, 'categoria': 'Bebidas'},
    {'id': 5, 'nome': 'Bolo de Pote', 'preco': 10.00, 'categoria': 'Doces'},
    {'id': 6, 'nome': 'Salada de Frutas', 'preco': 14.00, 'categoria': 'Doces'},
  ];

  List<Map<String, dynamic>> carrinho = [];

  app.get('/produtos', (Request req) {
    return Response.ok(jsonEncode(produtos), headers: {'Content-Type': 'application/json'});
  });

  app.get('/carrinho', (Request req) {
    return Response.ok(jsonEncode(carrinho), headers: {'Content-Type': 'application/json'});
  });

  app.post('/carrinho/add', (Request req) async {
    final body = await req.readAsString();
    final item = jsonDecode(body);
    carrinho.add(item);
    return Response.ok(jsonEncode({'mensagem': 'Item adicionado!'}), headers: {'Content-Type': 'application/json'});
  });

  app.delete('/carrinho/clear', (Request req) {
    carrinho.clear();
    return Response.ok(jsonEncode({'mensagem': 'Carrinho limpo!'}), headers: {'Content-Type': 'application/json'});
  });

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(app);

  final server = await io.serve(handler, 'localhost', 8080);
  print('✅ Servidor rodando em http://${server.address.host}:${server.port}');
}
