import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_vucudumuz/oyun_vucudumuz.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(vucudumuzConfig.title.length, 33);
    expect(vucudumuzConfig.tagline.length, 33);
    for (final s in vucudumuzConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(vucudumuzConfig.gameId, vucudumuzId);
    expect(vucudumuzRules.gameId, vucudumuzId);
    expect(vucudumuzConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(vucudumuzRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: vucudumuzId, optionalMechanics: vucudumuzRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(vucudumuzRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
