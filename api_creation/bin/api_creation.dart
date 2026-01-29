import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

List<Map<String, dynamic>> users = [];
int idCounter = 1;

void main() async {
  var router = Router();

  // === POST ===
 
  router.post('/addUser', (Request req) async {
    var body = await req.readAsString();
    var data = jsonDecode(body);

    var user = {
      "id": idCounter++,
      "name": data['name'],
      "email": data['email']
    };

    users.add(user);

    return Response.ok(
      jsonEncode(user),
      headers: {'Content-Type': 'application/json'},
    );
  });

  // === PUT ===
 
  router.put('/updateUser/<id>', (Request req, String id) async {
    var body = await req.readAsString();
    var data = jsonDecode(body);

    var user = users.firstWhere(
      (u) => u['id'] == int.parse(id),
      orElse: () => {},
    );

    if (user.isEmpty) {
      return Response.notFound("User not found");
    }

    user['name'] = data['name'];
    user['email'] = data['email'];

    return Response.ok(
      jsonEncode(user),
      headers: {'Content-Type': 'application/json'},
    );
  });

  // === DELETE ===
 
  router.delete('/deleteUser/<id>', (Request req, String id) {
    users.removeWhere((u) => u['id'] == int.parse(id));

    return Response.ok("User deleted successfully");
  });

  var server = await io.serve(router, 'localhost', 9000);
  print('Server running on http://localhost:9000');
}


