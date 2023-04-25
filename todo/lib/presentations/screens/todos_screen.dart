import 'package:flutter/material.dart';
import 'package:todo/presentations/screens/add_todo_screen.dart';
import 'package:todo/presentations/screens/app_button.dart';
import 'package:todo/presentations/screens/base_client.dart';
import 'package:todo/presentations/screens/user.dart';

class Todosscreen extends StatelessWidget {
  const Todosscreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddTodoScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const FlutterLogo(
              size: 72,
            ),
            AppButton(
              operation: 'GET',
              operationColor: Colors.lightGreen,
              description: 'Fetch users',
              onPressed: () async {
                var response =
                    await BaseClient().get('/users').catchError((err) {});
                if (response == null) return;
                debugPrint('successfull:');

                var users = userFromJson(response);
                debugPrint('Users count: ' + users.length.toString());
              },
            ),
            AppButton(
              operation: 'POST',
              operationColor: Colors.lightBlue,
              description: 'Add user',
              onPressed: () async {
                var user = User(
                  todos: "Milk put",
                  isCompleted: "false",
                  id: 1,
                );

                var response = await BaseClient()
                    .post('/users', user)
                    .catchError((err) {});
                if (response == null) return;
                debugPrint('successfull:');
              },
            ),
            AppButton(
              operation: 'PUT',
              operationColor: Colors.orangeAccent,
              description: 'Edit user',
              onPressed: () async {
                var id = 2;
                var user = User(
                  todos: "Milk record",
                  isCompleted: "false",
                  id: 1,
                );

                var response = await BaseClient()
                    .put('/users/$id', user)
                    .catchError((err) {});
                if (response == null) return;
                debugPrint('successfull:');
              },
            ),
            AppButton(
              operation: 'DEL',
              operationColor: Colors.red,
              description: 'Delete user',
              onPressed: () async {
                var id = 2;
                var response = await BaseClient()
                    .delete('/users/$id')
                    .catchError((err) {});
                if (response == null) return;
                debugPrint('successfull:');
              },
            ),
          ],
        ),
      )),
    );
  }
}
