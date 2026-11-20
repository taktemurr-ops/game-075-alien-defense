import '../core/arcade.dart';
import '../core/level_plan.dart';
import '../core/missions.dart';
import '../core/stats.dart';
import 'arena_engine.dart';

class AlienDefenseRules extends ArcadeRules<ArenaLevel> {
  @override
  String get gameId => 'game-075-alien-defense';

  @override
  List<String> get optionalMechanics => const ['boss', 'elites'];

  @override
  List<GameStat> get gameStats => const [
        GameStat('enemies_defeated', 'Yenilen düşman', 'Enemies defeated', scale: 300),
        GameStat('waves_survived', 'Atlatılan dalga', 'Waves survived', scale: 20),
        GameStat('bosses_defeated', 'Yenilen boss', 'Bosses defeated', scale: 3),
      ];

  @override
  List<MissionTemplate> get missionTemplates => const [
        MissionTemplate('enemies_defeated', 'enemies_defeated', [75, 150, 300]),
        MissionTemplate('waves_survived', 'waves_survived', [2, 5, 10], coinReward: 80),
      ];

  @override
  ArenaLevel generate(LevelSpec spec) => generateArena(ArenaKind.defense, spec);

  @override
  ArcadeMeta metaOf(ArenaLevel l) => l.meta;

  @override
  ArcadeSim createSim(ArenaLevel l) => ArenaSim(l);

  @override
  ArcadeInput bot(ArcadeSim sim) => arenaBot(sim);
}

ArcadeRules createRules() => AlienDefenseRules();
