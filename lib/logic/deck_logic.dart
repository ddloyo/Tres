import 'dart:math';
import '../models/card_model.dart';

List<CardModel> generateDeck() {
  List<CardModel> deck = [];
  int idCounter = 0;

  for (int value = 1; value <= 12; value++) {
    for (int copy = 0; copy < 3; copy++) {
      deck.add(CardModel(value: value, id: 'c$idCounter'));
      idCounter++;
    }
  }

  deck.shuffle(Random());
  return deck;
}
