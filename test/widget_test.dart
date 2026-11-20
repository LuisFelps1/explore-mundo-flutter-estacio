import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:explore_mundo/main.dart';

void main() {
  testWidgets('a tela inicial mostra o nome do aplicativo', (tester) async {
    await tester.pumpWidget(const ExploreMundoApp());

    expect(find.text('Explore Mundo'), findsOneWidget);
    expect(find.text('Sua próxima aventura começa aqui'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('a busca filtra os destinos', (tester) async {
    await tester.pumpWidget(const ExploreMundoApp());

    await tester.enterText(find.byType(TextField), 'Paris');
    await tester.pumpAndSettle();

    expect(find.text('Destinos para descobrir (1)'), findsOneWidget);

    await tester.drag(
      find.byType(ListView).first,
      const Offset(0, -400),
    );
    await tester.pumpAndSettle();

    expect(find.text('Paris'), findsNWidgets(2));
    expect(find.text('Rio de Janeiro'), findsNothing);
  });
}
