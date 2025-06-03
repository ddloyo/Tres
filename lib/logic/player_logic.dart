
import '../models/player_model.dart';

List<PlayerModel> createPlayers(int count) {
  return List.generate(count, (index) {
    return PlayerModel(
      id: 'player_$index',
      name: 'Jugador ${index + 1}',
      hand: [],
    );
  });
}

void dealCards(List<CardModel> deck, List<PlayerModel> players) {
  for (int i = 0; i < 5; i++) {
    for (var player in players) {
      player.hand.add(deck.removeLast());
    }
  }
}

