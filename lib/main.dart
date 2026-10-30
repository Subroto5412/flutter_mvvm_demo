import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'data/services/user_api_service.dart';
import 'data/repositories/user_repository.dart';
import 'features/users/view/users_screen.dart';
import 'features/users/viewmodel/users_viewmodel.dart';

void main() {
  final httpClient = http.Client();

  final apiService = UserApiService(httpClient);

  final repository = UserRepository(apiService);

  runApp(
    MyApp(repository: repository),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository repository;

  const MyApp({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsersViewModel(repository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter MVVM',
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          useMaterial3: true,
        ),
        home: const UsersScreen(),
      ),
    );
  }
}