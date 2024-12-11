function testGetHandRank()
{
    var hand1 = new Hand(); 
    var hand2 = new Hand();

    //straight flush
    hand1.clear();
    hand1.addCard(new Card(RANK.TWO, SUIT.CLUBS));
    hand1.addCard(new Card(RANK.THREE, SUIT.CLUBS));
    hand1.addCard(new Card(RANK.FOUR, SUIT.CLUBS));
    show_debug_message("Straight Flush: " + string(hand1.getHandRank())); 

    //three of a kind
    hand1.clear();
    hand1.addCard(new Card(RANK.FIVE, SUIT.HEARTS));
    hand1.addCard(new Card(RANK.FIVE, SUIT.DIAMONDS));
    hand1.addCard(new Card(RANK.FIVE, SUIT.CLUBS));
    show_debug_message("Three of a Kind: " + string(hand1.getHandRank())); 

    //straight
    hand1.clear();
    hand1.addCard(new Card(RANK.NINE, SUIT.CLUBS));
    hand1.addCard(new Card(RANK.TEN, SUIT.HEARTS));
    hand1.addCard(new Card(RANK.JACK, SUIT.SPADES));
    show_debug_message("Straight: " + string(hand1.getHandRank()));

    //flush
    hand1.clear();
    hand1.addCard(new Card(RANK.THREE, SUIT.DIAMONDS));
    hand1.addCard(new Card(RANK.SIX, SUIT.DIAMONDS));
    hand1.addCard(new Card(RANK.KING, SUIT.DIAMONDS));
    show_debug_message("Flush: " + string(hand1.getHandRank())); 

    //pair
    hand1.clear();
    hand1.addCard(new Card(RANK.QUEEN, SUIT.HEARTS));
    hand1.addCard(new Card(RANK.QUEEN, SUIT.CLUBS));
    hand1.addCard(new Card(RANK.ACE, SUIT.DIAMONDS));
    show_debug_message("Pair: " + string(hand1.getHandRank()));

    //high card
    hand1.clear();
    hand1.addCard(new Card(RANK.TWO, SUIT.HEARTS));
    hand1.addCard(new Card(RANK.FOUR, SUIT.CLUBS));
    hand1.addCard(new Card(RANK.KING, SUIT.DIAMONDS));
    show_debug_message("High Card: " + string(hand1.getHandRank())); 
}
