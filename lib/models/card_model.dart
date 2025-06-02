class CardModel{
    final int value; // de 1 a 12
    final String id; //unico para cada carta
    bool isRevealed; // para saber si esta boca arriba

    CardModel({
        required this.value,
        required this.id,
        this.isRevealed = false,
    };

    @override
    String toString() => 'Card($value, $id)';

    )
}