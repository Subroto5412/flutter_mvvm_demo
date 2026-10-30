import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_mvvm_demo/main.dart';
import 'package:flutter_mvvm_demo/data/repositories/user_repository.dart';
import 'package:flutter_mvvm_demo/features/users/view/users_screen.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  testWidgets('MyApp loads successfully', (WidgetTester tester) async {
    final repository = MockUserRepository();

    await tester.pumpWidget(
      MyApp(repository: repository),
    );

    expect(find.byType(UsersScreen), findsOneWidget);
  });
}