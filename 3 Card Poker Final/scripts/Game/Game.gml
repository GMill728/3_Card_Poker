// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function Game() constructor{
	playerMoney = 1000;		//game always starts with 1000
	anteBet = 0; 
	pairPlusBet = 0; 
	playBet = 0; 
	
	deck = new Deck();
	deck.shuffle(); 
	
	playerHand = new PokerHand();
	dealerHand = new PokerHand();
	
	
	//there are macros that I didn't add here
	
	//do I need to specify last player card and last dealer card???
	
	//put functions to call dealer specific things here
	
	
	//deal hands
	playerHand.addCard( deck.deal() );
	playerHand.addCard( deck.deal() );
	playerHand.addCard( deck.deal() );
	
	dealerHand.addCard( deck.deal() );
	dealerHand.addCard( deck.deal() );
	dealerHand.addCard( deck.deal() );
	
	//I think here you would call the enabling of the continue and fold buttons
	
	function redeal() {
		//here in black jack he deletes added cards but we don't have to worry about that
		
		//clear the hands
		playerHand.clear();
		dealerHand.clear();
		
		//resets the cards to the card backs while dealing
		objPlayerCard1.image_index = 0;
		objPlayerCard2.image_index = 0;
		objPlayerCard3.image_index = 0;
		
		objDealerCard1.image_index = 0;
		objDealerCard2.image_index = 0;
		objDealerCard3.image_index = 0;
		
		//enable and disable buttons as seen fit
	}//end redeal 
	
	
	function getPlayerMoney() {
		return playerMoney; 
	}//end getPlayerMoney
	
	/// @func setPairPlusBet(amount)
	/// @desc Sets the bet for pair plus and subtracts it from the player's money.
	/// @param {Real} amount The amount to change the bet to and subtract from the money.
	// William Grant 12/10/24
	function setPairPlusBet(amount) {
		pairPlusBet = amount;
		playerMoney -= pairPlusBet;
	}//end setPlayerBet
	
	/// @func setAnteBet(amount)
	/// @desc Sets the bet for ante and subtracts it from the player's money.
	/// @param {Real} amount The amount to change the bet to and subtract from the money.
	// William Grant 12/10/24
	function setAnteBet(amount) {
		anteBet = amount;
		playerMoney -= anteBet;
	}//end setPlayerBet
	
	/// @func setPlayBet(amount)
	/// @desc Sets the bet for play and subtracts it from the player's money.
	/// @desc Could be done another way probably, but just done for readability.
	/// @param {Real} amount The amount to change the bet to and subtract from the money.
	// William Grant 12/10/24
	function setPlayBet(amount) {
		playBet = amount;
		playerMoney -= playBet;
	}//end setPlayerBet

	function dealCards() 
	{
		playerHand.clear(); 
		dealerHand.clear(); 
		
		//reshuffle if low on cards
		if (deck.cardsLeft() < 6)
		{
			deck.shuffle(); 	
		}
		
		for (var i = 0; i < 3; i++)
		{
			playerHand.addCard(deck.deal());
			dealerHand.addCard(deck.deal()); 
		}
		playerCard1 = playerHand.getCard(0);
		playerCard2 = playerHand.getCard(1);
		playerCard3 = playerHand.getCard(2);
		
		objPlayerCard1.image_index = playerCard1.getRank() * 4 + playerCard1.getSuit() + 1;
		objPlayerCard2.image_index = playerCard2.getRank() * 4 + playerCard2.getSuit() + 1;
		objPlayerCard3.image_index = playerCard3.getRank() * 4 + playerCard3.getSuit() + 1;
		
		toggleBets(false);
	}
	
	/// @func toggleBets(toggleState)
	/// @desc Toggles all the bet buttons according to boolean
	/// @param {Bool} toggleState true = enabled, false = disabled
	// William Grant 12/10/24
	function toggleBets(toggleState)
	{
		objAnteBox.enabled = toggleState;
		objPairPlusBox.enabled = toggleState;
		objPlayBox.enabled = toggleState;
		objPlay.enabled = toggleState;
	}
}


//the next section flips cards but I don't know how that works with 3 card poker rules
//pretty sure cards flip at the end and winnings are calculated so there is no hit and bet sections
