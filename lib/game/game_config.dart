import 'package:flutter/material.dart';

import '../app/arcade_stage.dart';
import '../app/game_api.dart';
import '../core/game_rules.dart';
import 'arena_engine.dart';
import 'arena_view.dart';
import 'rules.dart';

final gameConfig = GameConfig(
  gameId: 'game-075-alien-defense',
  title: const ['Uzaylı Savunması', 'Alien Defense', 'Alien-Abwehr', 'Defensa Alienígena', 'Défense Alien'],
  tagline: const ['Üssü koru, istilacıları gökyüzünde durdur!', 'Protect the base and stop the invaders!', 'Schütze die Basis!', '¡Protege la base!', 'Protégez la base !'],
  seedColor: const Color(0xFF9D4EDD),
  icon: Icons.security,
  rules: AlienDefenseRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => ArenaSim((ctx.generated as GeneratedLevel<ArenaLevel>).puzzle),
    paint: paintArena,
    sound: arenaSound,
    boosterIcon: Icons.flare,
    boosterLabel: (l) => l == 'tr' ? 'Yörünge bombası' : 'Orbital strike',
    howTo: const ['Basılı tutup sağa-sola kaydır: taret hareket eder. Ateş otomatik; en yakın tehdidi vurur.', 'Hold and slide left/right to move the turret. It fires automatically at the closest threat.', 'Halten und seitlich ziehen.', 'Mantén y desliza a los lados.', 'Maintenez et glissez latéralement.'],
  ),
  tutorial: const [
    TutorialStep(Icons.swap_horiz, ['Tareti yatayda hareket ettir.', 'Move the turret sideways.', 'Turm seitlich bewegen.', 'Mueve la torreta.', 'Déplacez la tourelle.']),
    TutorialStep(Icons.home, ['Üssün can barı ekranın altında.', 'The base health bar is at the bottom.', 'Basis-Leiste unten.', 'Barra de base abajo.', 'Barre de la base en bas.']),
    TutorialStep(Icons.flare, ['Yörünge bombası ekranı rahatlatır.', 'The orbital strike clears the screen.', 'Orbitalschlag räumt auf.', 'El ataque orbital limpia.', 'La frappe orbitale nettoie.']),
  ],
);
