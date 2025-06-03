void main() {
  final deck = generateDeck();
  final players = createPlayers(4);
  dealCards(deck, players);

  for (var player in players) {
    print('${player.name} tiene: ${player.hand.map((c) => c.value)}');
  }

  print('Cartas en la mesa: ${deck.length}');
}
