function TestHand() {
    //straight flush
    var hand1 = new Hand();
    hand1.addCard(new Card(RANK.TWO, SUIT.HEARTS));
    hand1.addCard(new Card(RANK.THREE, SUIT.HEARTS));
    hand1.addCard(new Card(RANK.FOUR, SUIT.HEARTS));

    show_debug_message("Test Case 1: Straight Flush");
    show_debug_message("isStraight: " + string(hand1.isStraight()));
    show_debug_message("isFlush: " + string(hand1.isFlush()));
    show_debug_message("Hand Rank: " + string(hand1.getHandRank()));

    //three of a kind
    var hand2 = new Hand();
    hand2.addCard(new Card(RANK.KING, SUIT.SPADES));
    hand2.addCard(new Card(RANK.KING, SUIT.HEARTS));
    hand2.addCard(new Card(RANK.KING, SUIT.CLUBS));

    show_debug_message("\nTest Case 2: Three of a Kind");
    show_debug_message("isThreeOfAKind: " + string(hand2.isThreeOfAKind()));
    show_debug_message("Hand Rank: " + string(hand2.getHandRank()));

    //flush
    var hand3 = new Hand();
    hand3.addCard(new Card(RANK.TWO, SUIT.DIAMONDS));
    hand3.addCard(new Card(RANK.FIVE, SUIT.DIAMONDS));
    hand3.addCard(new Card(RANK.TEN, SUIT.DIAMONDS));

    show_debug_message("\nTest Case 3: Flush");
    show_debug_message("isFlush: " + string(hand3.isFlush()));
    show_debug_message("Hand Rank: " + string(hand3.getHandRank()));

    //high card
    var hand4 = new Hand();
    hand4.addCard(new Card(RANK.ACE, SUIT.CLUBS));
    hand4.addCard(new Card(RANK.FIVE, SUIT.HEARTS));
    hand4.addCard(new Card(RANK.JACK, SUIT.SPADES));

    show_debug_message("\nTest Case 4: High Card");
    show_debug_message("Hand Rank: " + string(hand4.getHandRank()));
	
	//pair 
	var hand5 = new Hand();
	hand5.addCard(new Card(RANK.QUEEN, SUIT.CLUBS));
	hand5.addCard(new Card(RANK.QUEEN, SUIT.HEARTS));
	hand5.addCard(new Card(RANK.THREE, SUIT.SPADES));

	show_debug_message("\nTest Case 5: Pair");
	show_debug_message("isPair: " + string(hand5.isPair()));
	show_debug_message("Hand Rank: " + string(hand5.getHandRank()));

    //yall can add more edge cases if you want
}
