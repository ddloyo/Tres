class PlayerModel {
  final String id;
  final String name;
  List<CardModel> hand;
  List<List<CardModel>> trios; // cada trío es una lista de 3 cartas

  PlayerModel({
    required this.id,
    required this.name,
    required this.hand,
    this.trios = const [],
  });

  void addTrio(List<CardModel> trio) {
    trios = [...trios, trio];
    hand.removeWhere((card) => trio.contains(card));
  }

  CardModel? getHighestCard() {
    if (hand.isEmpty) return null;
    return hand.reduce((a, b) => a.value > b.value ? a : b);
  }

  CardModel? getLowestCard() {
    if (hand.isEmpty) return null;
    return hand.reduce((a, b) => a.value < b.value ? a : b);
  }
}
