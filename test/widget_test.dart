import 'package:flutter_test/flutter_test.dart';
import 'package:flame/game.dart';
import 'package:flutter_fighter/game/fighter_game.dart';

void main() {
  testWidgets('Game widget loads test', (WidgetTester tester) async {
    // Build our game and trigger a frame.
    // Note: We use a local instance for testing.
    final game = FighterGame();
    await tester.pumpWidget(GameWidget(game: game));

    // Verify that the GameWidget is present.
    expect(find.byType(GameWidget<FighterGame>), findsOneWidget);
  });
}
