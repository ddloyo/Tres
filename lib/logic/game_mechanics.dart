//  GameSession para controlar toda la sesión.
import '../models/card_model.dart';
import '../models/player_model.dart';

class GameSession {
  final List<PlayerModel> players;
  final List<CardModel> tableCards; // cartas boca abajo
  int currentPlayerIndex = 0;
  bool isGameOver = false;

  GameSession({
    required this.players,
    required this.tableCards,
  });

  PlayerModel get currentPlayer => players[currentPlayerIndex];

  void nextTurn() {
    currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
  }

  bool checkWinCondition(PlayerModel player) {
    // Gana si tiene 3 tríos o un trío de 7s
    if (player.trios.length >= 3) return true;
    for (var trio in player.trios) {
      if (trio.every((card) => card.value == 7)) {
        return true;
      }
    }
    return false;
  }
}


// Acciones del jugador
import 'dart:math';

/// Revela una carta de la mesa (boca abajo)
CardModel? revealTableCard(GameSession session) {
  var unrevealed = session.tableCards.where((c) => !c.isRevealed).toList();
  if (unrevealed.isEmpty) return null;

  var selected = unrevealed[Random().nextInt(unrevealed.length)];
  selected.isRevealed = true;
  return selected;
}

/// Pide la carta más alta o más baja de un jugador
CardModel? requestCardFromPlayer(PlayerModel player, {required bool highest}) {
  return highest ? player.getHighestCard() : player.getLowestCard();
}


/// Intenta agregar una carta a una colección para formar trío
bool attemptTrio({
  required PlayerModel player,
  required List<CardModel> revealedCards,
}) {
  if (revealedCards.length < 3) return false;

  final first = revealedCards[0].value;
  final same = revealedCards.where((card) => card.value == first).toList();

  if (same.length == 3) {
    player.addTrio(same);
    return true;
  }
  return false;
}

//Turno completo
void playTurn(GameSession session, List<CardModel> revealedCards) {
  final player = session.currentPlayer;

  final formedTrio = attemptTrio(player: player, revealedCards: revealedCards);

  if (formedTrio) {
    print('${player.name} formó un trío de ${revealedCards[0].value}!');
  } else {
    print('${player.name} falló en formar trío.');
  }

  if (session.checkWinCondition(player)) {
    session.isGameOver = true;
    print('🎉 ${player.name} ganó la partida!');
    return;
  }

  session.nextTurn();
}

