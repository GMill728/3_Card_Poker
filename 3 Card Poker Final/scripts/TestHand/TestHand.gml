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
	
	//create Hand instances for player and dealer
    var playerHand = new Hand();
    var dealerHand = new Hand();

    // Test Case 1: Player has a better hand rank
    playerHand.addCard(new Card(RANK.ACE, SUIT.SPADES));
    playerHand.addCard(new Card(RANK.KING, SUIT.SPADES));
    playerHand.addCard(new Card(RANK.QUEEN, SUIT.SPADES)); // Straight Flush
    
    dealerHand.addCard(new Card(RANK.KING, SUIT.HEARTS));
    dealerHand.addCard(new Card(RANK.KING, SUIT.CLUBS));
    dealerHand.addCard(new Card(RANK.KING, SUIT.DIAMONDS)); // Three of a Kind
    
    var result = playerHand.compareHands(dealerHand);
    show_debug_message("Test Case 1: Player has a better hand rank. Result: " + string(result)); // Expected: 1
    
    // Reset hands
    playerHand.clear();
    dealerHand.clear();

    // Test Case 2: Dealer has a better hand rank
    playerHand.addCard(new Card(RANK.THREE, SUIT.SPADES));
    playerHand.addCard(new Card(RANK.FOUR, SUIT.HEARTS));
    playerHand.addCard(new Card(RANK.FIVE, SUIT.CLUBS)); // Straight
    
    dealerHand.addCard(new Card(RANK.FIVE, SUIT.SPADES));
    dealerHand.addCard(new Card(RANK.FIVE, SUIT.HEARTS));
    dealerHand.addCard(new Card(RANK.FIVE, SUIT.CLUBS)); // Three of a Kind
    
    result = playerHand.compareHands(dealerHand);
    show_debug_message("Test Case 2: Dealer has a better hand rank. Result: " + string(result)); // Expected: -1
    
    // Reset hands
    playerHand.clear();
    dealerHand.clear();

    // Test Case 3: Tie in hand rank, player wins with high card
    playerHand.addCard(new Card(RANK.THREE, SUIT.SPADES));
    playerHand.addCard(new Card(RANK.QUEEN, SUIT.HEARTS));
    playerHand.addCard(new Card(RANK.KING, SUIT.CLUBS)); // High Card
    
    dealerHand.addCard(new Card(RANK.QUEEN, SUIT.SPADES));
    dealerHand.addCard(new Card(RANK.KING, SUIT.CLUBS));
    dealerHand.addCard(new Card(RANK.TWO, SUIT.DIAMONDS)); // High Card
    
    result = playerHand.compareHands(dealerHand);
    show_debug_message("Test Case 3: Tie in hand rank, player wins with high card. Result: " + string(result)); // Expected: 1
    
    // Reset hands
    playerHand.clear();
    dealerHand.clear();

    // Test Case 4: Tie in hand rank, dealer wins with high card
    playerHand.addCard(new Card(RANK.TWO, SUIT.SPADES));
    playerHand.addCard(new Card(RANK.NINE, SUIT.HEARTS));
    playerHand.addCard(new Card(RANK.EIGHT, SUIT.CLUBS)); // High Card
    
    dealerHand.addCard(new Card(RANK.THREE, SUIT.SPADES));
    dealerHand.addCard(new Card(RANK.NINE, SUIT.CLUBS));
    dealerHand.addCard(new Card(RANK.EIGHT, SUIT.DIAMONDS)); // High Card
    
    result = playerHand.compareHands(dealerHand);
    show_debug_message("Test Case 4: Tie in hand rank, dealer wins with high card. Result: " + string(result)); // Expected: -1
    
    // Reset hands
    playerHand.clear();
    dealerHand.clear();

    // Test Case 5: Complete tie
    playerHand.addCard(new Card(RANK.FIVE, SUIT.SPADES));
    playerHand.addCard(new Card(RANK.SIX, SUIT.HEARTS));
    playerHand.addCard(new Card(RANK.SEVEN, SUIT.CLUBS)); // High Card
    
    dealerHand.addCard(new Card(RANK.FIVE, SUIT.CLUBS));
    dealerHand.addCard(new Card(RANK.SIX, SUIT.DIAMONDS));
    dealerHand.addCard(new Card(RANK.SEVEN, SUIT.HEARTS)); // High Card
    
    result = playerHand.compareHands(dealerHand);
    show_debug_message("Test Case 5: Complete tie. Result: " + string(result)); // Expected: 0

}
